require 'objects/cursor'
require 'objects/circle'
require 'objects/square'

local audio = require "lib/wave"

maingame = {}

local level1BG = love.graphics.newImage("assets/level01.png")
local level2BG = love.graphics.newImage("assets/level02.png")
local level3BG = love.graphics.newImage("assets/level03.png")
local respawnTime = 0
local timer

function maingame:load()
  cursor:load()  
  restartButton = newButton(gw/2 - 200, gh*0.46 - 50, 400, 150, function() maingame:restart() end)
  exitButton = newButton(gw/2 - 200, gh*0.57, 400, 150, function() maingame:endLevel() end)
end

function maingame:update(dt)
  if (isEndGame) then
    restartButton:update(dt)
    exitButton:update(dt)
  end
  
  cursor:update(dt)
  
  if not (isEndGame) then
    circle:update(dt)
    square:update(dt)
    timer = timer + dt
    if (respawnTime >= 0.18 / timer*20) then
      respawnTime = 0
      createCircle(320+timer*12)
      --createSquare(0, 220)
    else
      respawnTime = respawnTime + dt
    end
  end
end

function maingame:draw()  
  --love.graphics.setColor(0, 0, 0, 1)
  --love.graphics.setColor(25 / 255, 25 / 255, 25 / 255, 1)
  love.graphics.setColor(58 / 255, 65 / 255, 81 / 255, 1)
  love.graphics.circle("fill", gw / 2, gh / 2, 450)
  if (isEndGame) then
    maingame:endScreen()
  else
    circle:draw()
    --square:draw()
  end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(2)
  love.graphics.setFont(scoreFont)
  love.graphics.printf(string.format("%0.1f", timer), 0, gh*0.2, gw, "center")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(level1BG)
  love.graphics.setLineWidth(4)
  love.graphics.circle("line", gw / 2, gh / 2, 450)
  cursor:draw()
end

function maingame:mousepressed(x, y, button)
  if (isEndGame) then
    restartButton:mousepressed(x, y, button)
    exitButton:mousepressed(x, y, button)
  end
end

function maingame:keypressed(key)
  if (key == "escape") then
    isEndGame = true
    circle:clear()
    gamemusic:stop()
  end
end

function maingame:loadLevel(levelIndex)
  gamemusic = audio:newSource("songs/ParagonX9 - Chaoz Airflow.mp3", "stream")
  gamemusic:setVolume(volumeValue * 0.01)
  gamemusic:setLooping(true)
  maingame:restart()
end

function maingame:endScreen()
  love.graphics.setFont(bigScoreFont)
  
  if (restartButton:getHoverState()) then
    love.graphics.setColor(1, 1, 1, 1)
  else
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
  end
  love.graphics.printf("Restart", 0, gh*0.43, gw, "center")
  
  if (exitButton:getHoverState()) then
    love.graphics.setColor(1, 1, 1, 1)
  else
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
  end
  love.graphics.printf("Exit", 0, gh*0.57, gw, "center")
  
  love.graphics.setFont(smallScoreFont)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("NEW PERSONAL BEST", 0, gh*0.17, gw, "center")
end

function maingame:restart()
  timer = 0
  isEndGame = false
  gamemusic:play()
end

function maingame:endLevel()
  statemanager:changeState("menu")
  gamemusic:stop()
  menumusic:play()
end

return maingame
