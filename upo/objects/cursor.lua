cursortrail_array = require 'objects/cursortrail_array'

cursor = {}

local cursorPosX, cursorPosY

function cursor:update(dt, isEndGame, levelIndex)
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

  elseif (statemanager:getState() == "game" and not isEndGame) then
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
  cursortrail_array:update(dt, cursorPosX, cursorPosY, levelIndex)
end

function cursor:draw(isEndGame, levelIndex)
  cursortrail_array:draw()
  if (isEndGame) then
    love.graphics.setColor(Red)
  else
    love.graphics.setColor(DarkBlue)
  end
  love.graphics.circle('fill', cursorPosX, cursorPosY, 15, 120)
  love.graphics.setColor(White)
  love.graphics.setLineWidth(2)
  love.graphics.circle('line', cursorPosX, cursorPosY, 15, 120)
  love.graphics.circle('line', mx, my, 15)

  if (levelIndex == 2) then
    if (isEndGame) then
      love.graphics.setColor(Red)
    else
      love.graphics.setColor(DarkBlue)
    end
    love.graphics.circle('fill', -cursorPosX+gw, cursorPosY, 15, 120)
    love.graphics.setColor(White)
    love.graphics.circle('line', -cursorPosX+gw, cursorPosY, 15, 120)
    
    if (isEndGame) then
      love.graphics.setColor(Red)
    else
      love.graphics.setColor(DarkBlue)
    end
    love.graphics.circle('fill', cursorPosX, -cursorPosY+gh, 15, 120)
    love.graphics.setColor(White)
    love.graphics.circle('line', cursorPosX, -cursorPosY+gh, 15, 120)
    
    if (isEndGame) then
      love.graphics.setColor(Red)
    else
      love.graphics.setColor(DarkBlue)
    end
    love.graphics.circle('fill', -cursorPosX+gw, -cursorPosY+gh, 15, 120)
    love.graphics.setColor(White)
    love.graphics.circle('line', -cursorPosX+gw, -cursorPosY+gh, 15, 120)
  end

end

function cursor:getPositionX()
  return cursorPosX
end

function cursor:getPositionY()
  return cursorPosY
end

return cursor
