cursortrail_array = require 'objects/cursortrail_array'

cursor = {}

local cursorPosX, cursorPosY

function cursor:update(dt, levelIndex)
  local dx = mx - gw/2
  local dy = my - gh/2
  local dist = math.sqrt(dx^2+dy^2)

  if (statemanager:getState() == "menu") then
    if (dist < (450-19+menumusic:getEnergy()*10)) then
      cursorPosX = mx
      cursorPosY = my
    else
      cursorPosX = gw/2 + dx/dist*(450-19+menumusic:getEnergy()*10)
      cursorPosY = gh/2 + dy/dist*(450-19+menumusic:getEnergy()*10)
    end

  elseif (statemanager:getState() == "game") then
    if (levelIndex == 4) then      
      if (dist < (225-19)) then
        cursorPosX = mx
        cursorPosY = my
      else
        cursorPosX = gw/2 + dx/dist*(225-19)
        cursorPosY = gh/2 + dy/dist*(225-19)
      end
      
    elseif (levelIndex == 3) then      
      cursorPosX = gw/2 + dx/dist*(450-19)
      cursorPosY = gh/2 + dy/dist*(450-19)
      
    elseif (levelIndex == 2) then     
      if (my < gh/2-19) and (dist < (450-19)) then
        cursorPosX = mx
        cursorPosY = my
      elseif (my > gh/2-19) and (dist > (450-19)) then
        cursorPosX = gw/2 + dx/dist*(450-19)
        cursorPosY = gh/2-19
      elseif (my > gh/2-19) then
        cursorPosX = mx
        cursorPosY = gh/2-19
      elseif (dist > (450-19)) then
        cursorPosX = gw/2 + dx/dist*(450-19)
        cursorPosY = gh/2 + dy/dist*(450-19)
      end
    else
      if (dist < (450-19)) then
        cursorPosX = mx
        cursorPosY = my
      else
        cursorPosX = gw/2 + dx/dist*(450-19)
        cursorPosY = gh/2 + dy/dist*(450-19)
      end
    end
  end
  cursortrail_array:update(dt, cursorPosX, cursorPosY)
end

function cursor:draw(isEndGame)
  cursortrail_array:draw()
  love.graphics.setLineWidth(3)
  if (isEndGame) then
    love.graphics.setColor(231 / 255, 76 / 255, 60 / 255, 1)
  else
    love.graphics.setColor(42 / 255, 49 / 255, 61 / 255, 1)
  end
  love.graphics.circle('fill', cursorPosX, cursorPosY, 15, 120)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle('line', cursorPosX, cursorPosY, 15, 120)
  love.graphics.setLineWidth(2)
  love.graphics.circle('line', mx, my, 15)
end

function cursor:getPositionX()
  return cursorPosX
end

function cursor:getPositionY()
  return cursorPosY
end

return cursor
