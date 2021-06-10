level05 = {}

local respawnTime1, respawnTime2, respawnTime3, round

function level05:load()
  respawnTime1 = 0
  round = 100
end

function level05:update(dt, timer)
  if (respawnTime1 >= 3*math.log10(timer) and timer > 2) then
    respawnTime1 = 0
    round = round + 1
    createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    createSquare(220, 260)
    createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    
    if (round > 10) then
      createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    end
    if (round > 20) then
      createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    end
    if (round > 30) then
      createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    end
    if (round > 40) then
      createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    end
    if (round > 45) then
      createCircle(45, 280+timer, math.random(2*math.pi*100)/100, 0)
    end
    if (round > 50) then
      createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    end
    if (round > 55) then
      createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    end
    if (round > 60) then
      createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    end
    if (round > 65) then
      createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    end
    if (round > 70) then
      createKite(cursor:getPositionX(), cursor:getPositionY(), 250+timer)
    end
    if (round > 75) then
      createSquare(220, 260)
    end
  else
    respawnTime1 = respawnTime1 + dt
  end
end

return level05
