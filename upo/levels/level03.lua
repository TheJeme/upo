level03 = {}

local respawnTime1, respawnTime2, respawnTime3, round, trnAngle

function level03:load()
  respawnTime1 = 0
  respawnTime2 = 0
  respawnTime3 = 0
  round = 0
  trnAngle = 0
end

function level03:update(dt, timer)
  if (round >= 0) then
    if (respawnTime1 > 2/math.sqrt(timer)) then
      respawnTime1 = 0
      round = round + 1    
      createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      if (round > 15) then
        createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      end
      if (round > 15) then
        createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      end
      if (round > 20) then
        createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      end
      if (round > 27) then
        createCircle(45, 430+timer*4, math.random(2*math.pi*100)/100, 1)
      end
    else
      respawnTime1 = respawnTime1 + dt
    end
  end
  if (round > 13) then
    if (respawnTime2 > 0.6) then
      respawnTime2 = 0
      createCircle2(cursor:getPositionX(), cursor:getPositionY(), 45, 520)
    else
      respawnTime2 = respawnTime2 + dt
    end
  end
  if (round > 35) then
    if (respawnTime3 > 0.18) then
      respawnTime3 = 0
      trnAngle = trnAngle + 52 * dt
      createCircle(20, 530+timer*4, 0+trnAngle, 1)
      createCircle(20, 530+timer*4, math.pi/2+trnAngle, 1)
      createCircle(20, 530+timer*4, math.pi+trnAngle, 1)
      createCircle(20, 530+timer*4, 3*math.pi/2+trnAngle, 1)
    else
      respawnTime3 = respawnTime3 + dt
    end
  end
end

return level03
