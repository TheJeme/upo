local effectcircle = {}
listOfCircleEffects = {}

function newCircleEffect(radius, speed)
  local effect = {}
  effect.radius = radius
  effect.speed = speed
  
  table.insert(listOfCircleEffects, effect)
end

function effectcircle:update(dt)    
  for i, v in ipairs(listOfCircleEffects) do
  v.radius = v.radius + dt * v.speed
    if (v.radius > 2000) then
      table.remove(listOfCircleEffects, i)
    end
  end
end

function effectcircle:draw()
  love.graphics.setColor(1, 1, 1, 0.4)
  love.graphics.setLineWidth(6)
  for _, v in ipairs(listOfCircleEffects) do
    love.graphics.circle("line", gw/2, gh/2, v.radius)
  end
end

function effectcircle:clearCircleEffects()
  for i, v in ipairs(listOfCircleEffects) do
    table.remove(listOfCircleEffects, i)
  end
end

return effectcircle
