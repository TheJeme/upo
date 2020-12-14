circle = {}
listOfCircles = {}

function createCircle(speed)
  local crl = {}
  crl.rotation = math.random(0, math.pi*2)
  crl.speed = -speed
  crl.x = 500
  crl.y = math.random(0,400)
  
  table.insert(listOfCircles, crl)
end

function circle:update(dt)
  for i, v in ipairs(listOfCircles) do
    v.x = v.x + v.speed * dt
    if (math.abs(v.x) > 2000) then
      table.remove(listOfCircles, i)
    end
  end
end

function circle:draw()
    for i, v in ipairs(listOfCircles) do
      love.graphics.push()
      love.graphics.translate(gw / 2, gh / 2)
      love.graphics.rotate(v.rotation)
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.circle("fill", v.x, v.y, 45)
      love.graphics.pop()
    end
end

function circle:clear()
  for i, v in ipairs(listOfCircles) do
    listOfCircles[i] = nil
  end
end

return circle
