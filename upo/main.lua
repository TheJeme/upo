require 'lib/beloved'
require 'lib/simpleScale'

require 'globals'
require 'colors'

require 'managers/statemanager'
require 'managers/savemanager'

local discordRPC = require 'lib/discordRPC'
local appId = require 'applicationId'

function love.load()
  savemanager:load()
  volumeValue = savemanager.settings.volume
  resolutionIndex = savemanager.settings.resolutionIndex
  statemanager:load()
  math.randomseed(os.time())
  simpleScale.setWindow(gw, gh, resolutionList[resolutionIndex][1], resolutionList[resolutionIndex][2], {fullscreen = true})
  love.window.setVSync(0)
  cursor:load()
  beloved:load()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1, 1)
  love.mouse.setVisible(false)

  joystick = nil

  isJoystickMove = false
  joystickNoticeTextOpacity = 0

  discordRPC.initialize(appId, true)
  now = os.time(os.date("*t"))
  detailsNow = "In Mainmenu"
  stateNow = ""
  nextPresenceUpdate = 0
end

function discordApplyPresence()
  if statemanager:getState() == "game" then
    detailsNow = "Playing " .. maingame:getSong()
    stateNow = "By " .. maingame:getArtist()
  else
    detailsNow = "In Mainmenu"
    stateNow = ""
  end

  presence = {
    largeImageKey = "icon",
    largeImageText = "upo v0.0.8",
    details = detailsNow,
    state = stateNow,
    startTimestamp = now,
  }

  return presence
end

function love.update(dt)
  collectgarbage()
  mx = love.mouse.getX() / simpleScale.getScale()
  my = love.mouse.getY() / simpleScale.getScale()

  statemanager:update(dt)

  if nextPresenceUpdate < love.timer.getTime() then
      discordRPC.updatePresence(discordApplyPresence())
      nextPresenceUpdate = love.timer.getTime() + 2.0
  end
  discordRPC.runCallbacks()
end

function love.draw()
	simpleScale.set()
    statemanager:draw()
	simpleScale.unSet()
  beloved:draw()
  love.graphics.setFont(levelScoreFont)
  love.graphics.print("FPS " .. love.timer.getFPS())
end

function love.mousepressed(x, y, button)
  beloved:mousepressed(x, y, button)
  statemanager:mousepressed(x, y, button)
end

function love.gamepadpressed(joystick, button)
  statemanager:gamepadpressed(joystick, button)
  if (button == "y" and statemanager:getState() == "menu" and joystick ~= nil) then
    isJoystickMove = not isJoystickMove
    joystickNoticeTextOpacity = 1
  end
end

function love.keypressed(key)
  beloved:keypressed(key)
  statemanager:keypressed(key)
  if (key == "y" and statemanager:getState() == "menu" and joystick ~= nil) then
    isJoystickMove = not isJoystickMove
    joystickNoticeTextOpacity = 1
  end
end

function love.joystickadded(jstick)
  joystick = jstick
end

function love.joystickremoved(jstick)
  if (joystick == jstick) then
    joystick = nil
    if (isJoystickMove) then
      isJoystickMove = false
      joystickNoticeTextOpacity = 1
    end
  end
end

function love.quit()
  discordRPC.shutdown()
end
