square = {}
listOfSquares = {}

function createSquare(rotation, speed)
  sqr = {}
  sqr.rotation = rotation * math.pi/180
  sqr.speed = -speed
  sqr.position = 500

  table.insert(listOfSquares, sqr)
end

function square:update(dt)
  for i, v in ipairs(listOfSquares) do
    v.position = v.position + v.speed * dt

    if (math.abs(v.position) > 2000) then
      table.remove(listOfSquares, i)
    end
  end
end

function square:draw()
    for i, v in ipairs(listOfSquares) do
      love.graphics.push()
      love.graphics.translate(gw / 2, gh / 2)
      love.graphics.rotate(0)
      love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.rectangle("fill", v.position, 0, 25, 25)
      love.graphics.setColor(White)
      love.graphics.rectangle("line", v.position, 0, 25, 25)

      love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.rectangle("fill", v.position, 100, 25, 25)
      love.graphics.setColor(White)
      love.graphics.rectangle("line", v.position, 100, 25, 25)

      love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.rectangle("fill", v.position, 200, 25, 25)
      love.graphics.setColor(White)
      love.graphics.rectangle("line", v.position, 200, 25, 25)

      love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.rectangle("fill", v.position, 300, 25, 25)
      love.graphics.setColor(White)
      love.graphics.rectangle("line", v.position, 300, 25, 25)

      love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.rectangle("fill", v.position, 400, 25, 25)
      love.graphics.setColor(White)
      love.graphics.rectangle("line", v.position, 400, 25, 25)

      love.graphics.pop()
    end
end

return square
