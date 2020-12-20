level03 = {}

function level03:load()
  respawnTime = 0
end

function level03:update(dt, timer)
  if (respawnTime >= 2/math.sqrt(timer)) then
    respawnTime = 0
    createCircle(420+timer*7, 1)
    createCircle(420+timer*7, 1)
    createCircle(420+timer*7, 1)
    createCircle(420+timer*7, 1)
    
    trnAngle = math.random(0, 2*math.pi*100) / 100

    createTriangle(gw/2, gh/2, trnAngle+0, 420)
    createTriangle(gw/2, gh/2, trnAngle+math.pi/2, 420)
    createTriangle(gw/2, gh/2, trnAngle+math.pi, 420)
    createTriangle(gw/2, gh/2, trnAngle+3*math.pi/4, 420)
    createTriangle(gw/2, gh/2, trnAngle+math.pi/4, 420)
    createTriangle(gw/2, gh/2, trnAngle+7*math.pi/4, 420)
    createTriangle(gw/2, gh/2, trnAngle+5*math.pi/4, 420)
    createTriangle(gw/2, gh/2, trnAngle+3*math.pi/2, 420)
  else
    respawnTime = respawnTime + dt
  end
end

return level03
