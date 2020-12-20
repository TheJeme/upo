level04 = {}

function level04:load()
  respawnTime = 0
end

function level04:update(dt, timer)
  if (respawnTime >= 3/math.sqrt(timer)) then
    respawnTime = 0
    createCircle(320+timer*7, 0)
    createSquare(220)
    createKite(cursor:getPositionX(), cursor:getPositionY(), 420+timer*2)
  else
    respawnTime = respawnTime + dt
  end
end

return level04