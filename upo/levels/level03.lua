level03 = {}

local respawnTime, respawnTime2, round

function level03:load()
  respawnTime = 0
  respawnTime2 = 0
  round = 0
end

function level03:update(dt, timer)
  if (round > 10) then
    if (respawnTime2 > 0.4) then
      respawnTime2 = 0
      createCircle2(cursor:getPositionX(), cursor:getPositionY(), 520+timer*5)
    else
      respawnTime2 = respawnTime2 + dt
    end
  end
  
  if (respawnTime > 2/math.sqrt(timer)) then
    respawnTime = 0
    round = round + 1    
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    createCircle(460+timer*5, 1)
    
    trnAngle = math.random(0, 2*math.pi*100) / 100
  else
    respawnTime = respawnTime + dt
  end
end

return level03
