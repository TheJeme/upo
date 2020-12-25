level02 = {}

local respawnTime

function level02:load()
  respawnTime = 0
end

function level02:update(dt, timer)
  if (respawnTime >= 3/math.sqrt(timer)) then
    respawnTime = 0
    --createLaser2(300)
    
    createCircle(320+timer*7, 0)
  else
    respawnTime = respawnTime + dt
  end
end

return level02
