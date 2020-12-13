require 'objects/cursor'
require 'objects/circle'
require 'objects/square'

local audio = require "lib/wave"

maingame = {}

levelSongs = {audio:newSource("songs/ParagonX9 - Chaoz Airflow.mp3", "stream"),
              audio:newSource("songs/Hinkik - Explorers.mp3", "stream"),
              audio:newSource("songs/Hinkik - Time Leaper.mp3", "stream"),
              audio:newSource("songs/Lchavasse - Lunar Abyss.mp3", "stream"),
              audio:newSource("songs/Xtrullor - Supernova.mp3", "stream"),
              audio:newSource("songs/Kurokotei - Galaxy Collapse.mp3", "stream")}

local hiddenBG = love.graphics.newImage("assets/hidden.png")
local level1BG = love.graphics.newImage("assets/level01.png")
local level2BG = love.graphics.newImage("assets/level02.png")
local level3BG = love.graphics.newImage("assets/level03.png")

local respawnTime = 0
local levelIndex
local timer

function maingame:load()
  restartButton = newButton(gw/2 - 200, gh*0.44, 400, 130, function() maingame:restart() end)
  exitButton = newButton(gw/2 - 200, gh*0.56, 400, 130, function() maingame:endLevel() end)
end

function maingame:update(dt)
  cursor:update(dt, levelIndex)
  if (isEndGame) then
    restartButton:update(dt)
    exitButton:update(dt)
  end
  
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
  love.graphics.setColor(58 / 255, 65 / 255, 81 / 255, 1)
    love.graphics.setLineWidth(4)
  love.graphics.circle("fill", gw / 2, gh / 2, 450)
  if (isEndGame) then
    if (levelIndex == 3) then
      love.graphics.setColor(0.1, 0.1, 0.1, 1)
      love.graphics.circle("fill", gw / 2, gh / 2, 150)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.circle("line", gw / 2, gh / 2, 150)
    end
    maingame:endScreen()
  else
    circle:draw(isEndGame)
    --square:draw()
    
    if (levelIndex == 2) then
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.line(gw/2-450, gh/2, gw/2+450, gh/2)
    elseif (levelIndex == 3) then
      love.graphics.setColor(0.1, 0.1, 0.1, 1)
      love.graphics.circle("fill", gw / 2, gh / 2, 150)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.circle("line", gw / 2, gh / 2, 150)
    end
  end
  
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(scoreFont)
  
  if (levelIndex == 4) then
    love.graphics.draw(level3BG)
    love.graphics.circle("line", gw / 2, gh / 2, 225)
    love.graphics.printf(string.format("%0.1f", timer), 0, gh*0.4, gw, "center")
  elseif (levelIndex == 5) then
    love.graphics.draw(level2BG)
    love.graphics.draw(hiddenBG, cursor:getPositionX(), cursor:getPositionY(), 0, 1, 1, hiddenBG:getWidth() / 2, hiddenBG:getHeight() / 2)
    love.graphics.circle("line", gw / 2, gh / 2, 450)
    love.graphics.printf(string.format("%0.1f", timer), 0, gh*0.2, gw, "center")
  else
    love.graphics.draw(level1BG)
    love.graphics.circle("line", gw / 2, gh / 2, 450)
    love.graphics.printf(string.format("%0.1f", timer), 0, gh*0.2, gw, "center")
  end
  
  cursor:draw(isEndGame)
end

function maingame:mousepressed(x, y, button)
  if (isEndGame) then
    restartButton:mousepressed(x, y, button)
    exitButton:mousepressed(x, y, button)
  end
end

function maingame:keypressed(key)
  if (key == "escape") then
    die()
  end
end

function maingame:loadLevel(index)
  levelIndex = index
  gamemusic = levelSongs[levelIndex]
  gamemusic:setVolume(volumeValue * 0.01)
  gamemusic:setLooping(true)
  maingame:restart()
end

function die()
  isEndGame = true
  circle:clear()
  gamemusic:stop()
end

function maingame:endScreen()
  love.graphics.setFont(bigScoreFont)
  
  if (restartButton:getHoverState()) then
    love.graphics.setColor(1, 1, 1, 1)
  else
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
  end
  love.graphics.printf("Restart", 0, gh*0.44, gw, "center")
  
  if (exitButton:getHoverState()) then
    love.graphics.setColor(1, 1, 1, 1)
  else
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
  end
  love.graphics.printf("Exit", 0, gh*0.56, gw, "center")
  
  love.graphics.setFont(smallScoreFont)
  love.graphics.setColor(1, 1, 1, 1)
  if (levelIndex == 4) then
    love.graphics.printf("NEW PERSONAL BEST", 0, gh*0.37, gw, "center")
  else
    love.graphics.printf("NEW PERSONAL BEST", 0, gh*0.17, gw, "center")
  end
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
