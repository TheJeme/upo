square = {}
listOfSquares = {}

function createSquare(y, rotation, speed, isExploable)
  local sqr = {}
  sqr.rotation = rotation * math.pi/180
  sqr.speed = speed
  sqr.x = 500
  sqr.y = y
  sqr.isExploable = isExploable

  table.insert(listOfSquares, sqr)
end

function square:update(dt)
  for i, v in ipairs(listOfSquares) do
    v.x = v.x + v.speed * dt
    if (v.isExploable and v.x > 800) then
      createTriangle(v.x, v.y, 0, 420)
      createTriangle(v.x, v.y, math.pi/2, 420)
      createTriangle(v.x, v.y, math.pi, 420)
      createTriangle(v.x, v.y, 3*math.pi/4, 420)
      createTriangle(v.x, v.y, math.pi/4, 420)
      createTriangle(v.x, v.y, 7*math.pi/4, 420)
      createTriangle(v.x, v.y, 5*math.pi/4, 420)
      createTriangle(v.x, v.y, 3*math.pi/2, 420)
      table.remove(listOfSquares, i)      
    elseif (v.x > 1500) then
      table.remove(listOfSquares, i)
    end
  end
end

function square:draw()
    for i, v in ipairs(listOfSquares) do
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.rectangle("fill", v.x, v.y, 25, 25, 10)
    end
end

function square:clear()
  for i in pairs(listOfSquares) do
    listOfSquares[i] = nil
  end
end

return square
