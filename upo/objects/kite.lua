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

  table.insert(listOfKites, kte)
end

function kite:update(dt)
  for i, v in ipairs(listOfKites) do
    v.x = v.x + v.speed * dt
    if (v.x < -800) then
      table.remove(listOfKites, i)
    end
  end
end

function kite:draw()
    for _, v in ipairs(listOfKites) do
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.circle("fill", math.sin(v.rotation)*v.x+gw/2, math.cos(v.rotation)*v.x+gh/2, 28, 4)
    end
end

function kite:clear()
  for i in pairs(listOfKites) do
    listOfKites[i] = nil
  end
end

return kite
