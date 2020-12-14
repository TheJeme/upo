kite = {}
listOfKites = {}

function createKite(targetX, targetY, speed)
  local kte = {}
  kte.rotation = 0
  kte.speed = -speed
  kte.targetX = targetX
  kte.targetY = targetY
  kte.x = 500
  kte.y = 500
  kte.angleToCircle = math.atan2(v.y - v.targetY, v.x - v.targetX)
  
  table.insert(listOfKites, kte)
end

function kite:update(dt)
  for i, v in ipairs(listOfKites) do
    v.angleToCircle = math.atan2(v.y - v.targetY, v.x - v.targetX)
    v.x = v.x + math.cos(v.angleToCircle) * v.speed * dt
    v.y = v.y + math.sin(v.angleToCircle) * v.speed * dt
    if (math.abs(v.x) > 2000) then
      table.remove(listOfKites, i)
    end
  end
end

function kite:draw()
    for _, v in ipairs(listOfKites) do
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.circle("fill", v.x, v.y, 28, 4)
    end
end

function kite:clear()
  for i, v in ipairs(listOfKites) do
    listOfKites[i] = nil
  end
end

return kite
