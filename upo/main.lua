require 'beloved'
require 'globals'
require 'colors'

require 'managers/statemanager'
require 'managers/gamemanager'

function love.load()
  math.randomseed(os.time())
  beloved:load()
  statemanager:load()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1, 1)
  love.mouse.setVisible(false)
end

function love.update(dt)
  mx = love.mouse.getX()
  my = love.mouse.getY()
  statemanager:update(dt)
end

function love.draw()
  statemanager:draw()
  beloved:draw()
end


function love.mousepressed(x, y, button)
  beloved:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
  beloved:mousereleased(x, y, button)
end

function love.keypressed(key)
  beloved:keypressed(key) 
  if (key == "escape") then
    love.event.quit()
  end
end
