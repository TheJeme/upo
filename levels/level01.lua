level01 = {}

local respawnTime

function level01:load()
  respawnTime = 0
end

function level01:update(dt, timer)
  if (respawnTime >= 5/math.sqrt(timer)) then
    respawnTime = 0  
    createCircle(45, 420+timer*3, math.random(2*math.pi*100)/100, 0)
    createCircle(45, 420+timer*3, math.random(2*math.pi*100)/100, 0)
    createCircle(45, 420+timer*3, math.random(2*math.pi*100)/100, 0)
    createSquare(220, 320)
    
    createKite(cursor:getPositionX(), cursor:getPositionY(), 220+timer*2)    
  else
    respawnTime = respawnTime + dt
  end
end

return level01
