triangle = {}
listOfTriangles = {}

function createTriangle(targetX, targetY, rotation, speed)
  local trn = {}
  trn.rotation = rotation
  trn.speed = speed
  trn.targetX = targetX
  trn.targetY = targetY
  trn.x = 0
  trn.y = 0
  
  table.insert(listOfTriangles, trn)
end

function triangle:update(dt)
  for i, v in ipairs(listOfTriangles) do
    v.x = v.x + v.speed * dt
    if (v.x > 2000) then
      table.remove(listOfTriangles, i)
    end
  end
end

function triangle:draw()
    for _, v in ipairs(listOfTriangles) do
      love.graphics.push()
      love.graphics.translate(v.targetX, v.targetY)
      love.graphics.rotate(v.rotation)
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.polygon('fill', v.x+0, v.y+0, v.x+0, v.y+24, v.x+30, v.y+12)
      love.graphics.pop()
    end
end

function triangle:clear()
  for i in pairs(listOfTriangles) do
    listOfTriangles[i] = nil
  end
end

return triangle
