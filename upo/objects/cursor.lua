cursortrail_array = require 'objects/cursortrail_array'

cursor = {}

local cursorPosX, cursorPosY

function cursor:load()
  cursorPosX = 0
  cursorPosY = 0
end

function cursor:update(dt)
  local dx = mx - gw/2
  local dy = my - gh/2
  local dist = math.sqrt(dx^2+dy^2)
  
  if (dist < (450-12+menumusic:getEnergy()*10)) then
    cursorPosX = mx
    cursorPosY = my    
  else
    if (statemanager:getState() == "menu") then  
      cursorPosX = gw/2 + dx/dist*(450-19+menumusic:getEnergy()*10)
      cursorPosY = gh/2 + dy/dist*(450-19+menumusic:getEnergy()*10)
    else
      cursorPosX = gw/2 + dx/dist*(450-18)
      cursorPosY = gh/2 + dy/dist*(450-18)
    end
  end
  cursortrail_array:update(dt, cursorPosX, cursorPosY)
end

function cursor:draw()
  cursortrail_array:draw()
  love.graphics.setLineWidth(3)
  love.graphics.setColor(42 / 255, 49 / 255, 61 / 255, 1)
  love.graphics.circle('fill', cursorPosX, cursorPosY, 15, 120)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle('line', cursorPosX, cursorPosY, 15, 120)
  love.graphics.setLineWidth(2)
  love.graphics.circle('line', mx, my, 15)
end

return cursor
