level01 = {}

local respawnTime

function level01:load()
  respawnTime = 0
end

function level01:update(dt, timer)
  if (respawnTime >= 5/math.sqrt(timer)) then
    respawnTime = 0  
    createCircle(420+timer*3, 0)
    createCircle(420+timer*3, 0)
    createCircle(420+timer*3, 0)
    createSquare(220)
    
    createKite(cursor:getPositionX(), cursor:getPositionY(), 220+timer*2)    
  else
    respawnTime = respawnTime + dt
  end
end

return level01
