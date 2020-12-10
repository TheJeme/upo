require 'objects/cursor'
require 'objects/circle'
require 'objects/square'
require 'states/particles'

maingame = {}


mainBG = love.graphics.newImage("maingame_area.png")
respawnTime = 0
rotation = 0

function maingame:load()
  cursor:load()
  particles:load()
  
  restartButton = newButton(gw/2 - 200, gh*0.46 - 50, 400, 150, function() maingame:restart() end)
  exitButton = newButton(gw/2 - 200, gh*0.57, 400, 150, function() maingame:endLevel() end)
end

function maingame:update(dt)
  if (isEndGame) then
    restartButton:update(dt)
    exitButton:update(dt)
  end
  
  circle:update(dt)
  square:update(dt)
  cursor:update(dt)
  particles:update(dt)
  
  rotation = rotation + dt * 1100 * math.random()
  
  if (respawnTime >= 0.18) then
    respawnTime = 0
    createCircle(rotation, 220)
    --createSquare(0, 220)
  else
    respawnTime = respawnTime + dt
  end
end

function maingame:draw()  
  love.graphics.setColor(58 / 255, 65 / 255, 81 / 255, 1)
  love.graphics.circle("fill", gw / 2, gh / 2, 450)

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(2)
  love.graphics.setFont(scoreFont)
  love.graphics.printf("123.54", 0, gh*0.2, gw, "center")
  --circle:draw()
  --square:draw()
  --particles:draw()
  love.graphics.draw(mainBG)
  love.graphics.setLineWidth(4)
  love.graphics.circle("line", gw / 2, gh / 2, 450)
  if (isEndGame) then
    maingame:endScreen()
  end
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
  end
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
  isEndGame = false
end

function maingame:endLevel()
  statemanager:changeState("menu")
  menumusic:play()
end

return maingame
