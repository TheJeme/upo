cursortrail_array = require 'objects/cursortrail_array'

cursor = {}

local cursorPosX, cursorPosY

function cursor:load()
  cursorMX = gw/2
  cursorMY = gh/2
end

function cursor:update(dt, isEndGame, levelIndex)  
  
  if (joystickNoticeTextOpacity > 0) then
    joystickNoticeTextOpacity = joystickNoticeTextOpacity - dt / 2
  else
    joystickNoticeTextOpacity = 0
  end
    
  if (isJoystickMove and joystick ~= nil) then
    if (math.abs(joystick:getGamepadAxis("leftx")) > 0.05 or math.abs(joystick:getGamepadAxis("lefty")) > 0.05) then
      cursorMX = cursorMX + joystick:getGamepadAxis("leftx") * dt * 800
      cursorMY = cursorMY + joystick:getGamepadAxis("lefty") * dt * 800
    elseif (math.abs(joystick:getGamepadAxis("rightx")) > 0.05 or math.abs(joystick:getGamepadAxis("righty")) > 0.05) then
      cursorMX = cursorMX + joystick:getGamepadAxis("rightx") * dt * 800
      cursorMY = cursorMY + joystick:getGamepadAxis("righty") * dt * 800
    end
  else
    cursorMX = mx
    cursorMY = my
  end
  
  if (cursorMX > gw) then
    cursorMX = gw
  elseif (cursorMX < 0) then
    cursorMX = 0
  end
  
  if (cursorMY > gh) then
    cursorMY = gh
  elseif (cursorMY < 0) then
    cursorMY = 0
  end
  
  local dx = cursorMX - gw/2
  local dy = cursorMY - gh/2
  local dist = math.sqrt(dx^2+dy^2)

  if (statemanager:getState() == "menu") then
    if (dist < (450-19+menumusic:getEnergy()*10)) then
      cursorPosX = cursorMX
      cursorPosY = cursorMY
    else
      cursorPosX = gw/2 + dx/dist*(450-19+menumusic:getEnergy()*10)
      cursorPosY = gh/2 + dy/dist*(450-19+menumusic:getEnergy()*10)
    end

  elseif (statemanager:getState() == "game" and not isEndGame) then
    if (levelIndex == 4) then
      if (dist < (225-19)) then
        cursorPosX = cursorMX
        cursorPosY = cursorMY
      else
        cursorPosX = gw/2 + dx/dist*(225-19)
        cursorPosY = gh/2 + dy/dist*(225-19)
      end

    elseif (levelIndex == 3) then
      cursorPosX = gw/2 + dx/dist*(450-19)
      cursorPosY = gh/2 + dy/dist*(450-19)
    else
      if (dist < (450-19)) then
        cursorPosX = cursorMX
        cursorPosY = cursorMY
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
  love.graphics.circle('line', cursorMX, cursorMY, 15)
  
  if (joystickNoticeTextOpacity > 0) then
    love.graphics.setColor(1, 1, 1, joystickNoticeTextOpacity)
    love.graphics.setFont(levelTitleFont)
    if (isJoystickMove) then
      love.graphics.print("Joystick movement enabled", cursorPosX-200, cursorPosY-50)
    else
      love.graphics.print("Joystick movement disabled", cursorPosX-200, cursorPosY-50)
    end
  end
  love.graphics.setColor(White)
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
