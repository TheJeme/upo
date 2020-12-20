level01 = {}

function level01:load()
  respawnTime = 0
end

function level01:update(dt, timer)
  if (respawnTime >= 3/math.sqrt(timer)) then
    respawnTime = 0
    --createCircle(320+timer*7, 0)
    --createSquare(220)
    createLaser(500)
    --createLaser2(400)
    --createKite(cursor:getPositionX(), cursor:getPositionY(), 420+timer*2)
  else
    respawnTime = respawnTime + dt
  end
end

return level01
