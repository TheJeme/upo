circle = {}
listOfCircles = {}

function createCircle(rotation, speed)
  crl = {}
  crl.rotation = rotation * math.pi/180
  crl.speed = -speed
  crl.position = 500
  
  table.insert(listOfCircles, crl)
end

function circle:update(dt)
  for i, v in ipairs(listOfCircles) do
    v.position = v.position + v.speed * dt
    
    if (math.abs(v.position) > 2000) then
      --TODO this fix
    end
  end
end

function circle:draw()
    for i, v in ipairs(listOfCircles) do
      love.graphics.push()
      love.graphics.translate(gw / 2, gh / 2)
      love.graphics.rotate(v.rotation)
      love.graphics.setColor(245 / 255, 85 / 255, 109 / 255, 1)
      --love.graphics.setColor(245 / 255, 220 / 255, 85 / 255, 1)
      --love.graphics.setColor(109 / 255, 245 / 255, 85 / 255, 1)
      love.graphics.circle("fill", v.position, 0, 45)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.circle("line", v.position, 0, 45)
      love.graphics.pop()
    end
end

return circle
