level06 = {}

function level06:load()
  respawnTime = 0
end

function level06:update(dt, timer)
  if (respawnTime >= 5/math.sqrt(timer)) then
    respawnTime = 0
    createCircle(320+timer*7, 0)
    createSquare(220)
    createLaser(500)
    createKite(cursor:getPositionX(), cursor:getPositionY(), 420+timer*2)
  else
    respawnTime = respawnTime + dt
  end
end

return level06
