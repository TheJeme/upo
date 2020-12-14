kite = {}
listOfKites = {}

function createKite(targetX, targetY, speed)
  local kte = {}
  kte.rotation = math.random(2*math.pi*100)/100
  kte.speed = -speed
  kte.targetX = targetX
  kte.targetY = targetY
  kte.x = 1000
  kte.y = 0
  kte.angleToCircle = 0
  
  table.insert(listOfKites, kte)
end

function kite:update(dt)
  for i, v in ipairs(listOfKites) do
    v.x = v.x + v.speed * dt
    if (math.abs(v.x) > 2000) then
      table.remove(listOfKites, i)
    end
  end
end

function kite:draw()
    for _, v in ipairs(listOfKites) do
      love.graphics.push()
      love.graphics.translate(v.targetX, v.targetY)
      love.graphics.rotate(v.rotation)
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.circle("fill", v.x, v.y, 28, 4)
      love.graphics.pop()
    end
end

function kite:clear()
  for i, v in ipairs(listOfKites) do
    listOfKites[i] = nil
  end
end

return kite
