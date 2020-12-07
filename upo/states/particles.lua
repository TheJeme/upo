particles = {}

function particles:load()
  local img = love.graphics.newImage("circle.png")
   
  psystem = love.graphics.newParticleSystem(img)
  psystem:setPosition(gw/2, gh/2)
  psystem:setEmissionArea('borderellipse', gw/2, gh/2)
	psystem:setParticleLifetime(20)
	psystem:setEmissionRate(10)
	psystem:setSpeed(10, 30)
end

function particles:update(dt)
  psystem:update(dt)
end

function particles:draw()
  --love.graphics.draw(psystem)
end

return particles
