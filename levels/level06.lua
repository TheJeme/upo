level06 = {}

function level06:load()
  respawnTime = 0
end

function level06:update(dt, timer)
  if (respawnTime >= 5/math.sqrt(timer)) then
    respawnTime = 0
    createCircle(45, 320+timer*7, math.random(2*math.pi*100)/100, 0)
    createSquare(220, 320)
    createLaser(500)
    createKite(cursor:getPositionX(), cursor:getPositionY(), 420+timer*2)
  else
    respawnTime = respawnTime + dt
  end
end

return level06
