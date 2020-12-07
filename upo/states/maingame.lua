require 'objects/player'
require 'objects/circle'
require 'objects/square'
require 'states/particles'

maingame = {}


mainBG = love.graphics.newImage("maingame_area.png")
respawnTime = 0
rotation = 0

function maingame:load()
  player:load()
  particles:load()
end

function maingame:update(dt)
  circle:update(dt)
  square:update(dt)
  player:update(dt)
  particles:update(dt)
  
  rotation = rotation + dt * 1100 * math.random()
  
  if (respawnTime >= 0.18) then
    respawnTime = 0
    createCircle(rotation, 220)
    --createSquare(0, 220)
  else
    respawnTime = respawnTime + dt
  end
end

function maingame:draw()  
  
  
  love.graphics.setColor(0.2, 0.2, 0.2, 1)
  love.graphics.circle("fill", gw / 2, gh / 2, 450)

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(2)
  love.graphics.circle("line", gw / 2, gh / 2, 25)
  
  circle:draw()
  square:draw()
  particles:draw()
  love.graphics.draw(mainBG)
  love.graphics.setLineWidth(4)
  love.graphics.circle("line", gw / 2, gh / 2, 450)
  player:draw()

  love.graphics.printf("", 0, gh*0.2, gw, "center")
end

return maingame
