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
  else
    respawnTime = respawnTime + dt
  end
end

return level03
