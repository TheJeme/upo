player = {}

local playerPosX, playerPosY

function player:load()
  playerPosX = 0
  playerPosY = 0
end

function player:update(dt)
  --positionToMouseX = mx - playerPosX
  --positionToMouseY = my - playerPosY
  --playerPosX = playerPosX + (positionToMouseX * dt * 8)
  --playerPosY = playerPosY + (positionToMouseY * dt * 8)
  

  
  
  local dist = (mx - gw/2)^2 + (my - gh/2)^2
  if (dist < (450-12)^2) then
    playerPosX = mx
    playerPosY = my
  end
end

function player:draw()
  
  love.graphics.setLineWidth(3)
  love.graphics.setColor(86 / 255, 155 / 255, 222 / 255, 1)
  love.graphics.circle('fill', playerPosX, playerPosY, 15, 120)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle('line', playerPosX, playerPosY, 15, 120)
  
  love.graphics.setLineWidth(2)
  love.graphics.circle('line', mx, my, 12)
  --love.graphics.polygon('line', playerPosX - 14, playerPosY + 10, 
  --                              14 + playerPosX - 14, -25 + playerPosY + 10,
  --                              28 + playerPosX - 14, playerPosY + 10)
end

return player
