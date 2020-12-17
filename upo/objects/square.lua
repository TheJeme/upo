square = {}
listOfSquares = {}

function createSquare(speed)
  local sqr = {}
  sqr.speed = speed
  sqr.direction = math.random(1,4) --1=down, 2=right, 3=left, 4=up
  if (sqr.direction == 1) then
    sqr.x = math.random(200, 1400)
    sqr.y = -100
  elseif (sqr.direction == 2) then
    sqr.x = 500
    sqr.y = math.random(200, 900)
  elseif (sqr.direction == 3) then
    sqr.x = gw-200
    sqr.y = math.random(200, 900)
  elseif (sqr.direction == 4) then
    sqr.x = math.random(200, 1400)
    sqr.y = gh
  end
  
  sqr.timeTillExplode = math.random(400, 800)
  
  table.insert(listOfSquares, sqr)
end

function square:update(dt)
  for i, v in ipairs(listOfSquares) do
    v.timeTillExplode = v.timeTillExplode - v.speed * dt
    if (v.direction == 1) then
      v.y = v.y + v.speed * dt
    elseif (v.direction == 2) then
      v.x = v.x + v.speed * dt
    elseif (v.direction == 3) then
      v.x = v.x - v.speed * dt
    elseif (v.direction == 4) then
      v.y = v.y - v.speed * dt
    end
    
    if (v.timeTillExplode < 0) then
      createTriangle(v.x+15, v.y+15, 0, 420)
      createTriangle(v.x+15, v.y+15, math.pi/2, 420)
      createTriangle(v.x+15, v.y+15, math.pi, 420)
      createTriangle(v.x+15, v.y+15, 3*math.pi/4, 420)
      createTriangle(v.x+15, v.y+15, math.pi/4, 420)
      createTriangle(v.x+15, v.y+15, 7*math.pi/4, 420)
      createTriangle(v.x+15, v.y+15, 5*math.pi/4, 420)
      createTriangle(v.x+15, v.y+15, 3*math.pi/2, 420)
      table.remove(listOfSquares, i)      
    end
  end
end

function square:draw()
    for i, v in ipairs(listOfSquares) do
      love.graphics.setColor(28 / 255, 31 / 255, 39 / 255, 1)
      love.graphics.rectangle("fill", v.x, v.y, 30, 30, 4)
    end
end

function square:clear()
  for i in pairs(listOfSquares) do
    listOfSquares[i] = nil
  end
end

return square
