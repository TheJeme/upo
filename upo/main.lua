require 'lib/beloved'
require 'lib/simpleScale'

require 'globals'
require 'colors'

require 'managers/statemanager'
require 'managers/gamemanager'

function love.load()
  math.randomseed(os.time())
  simpleScale.setWindow(gw, gh, 1280, 720)
  love.window.setVSync(0)
  beloved:load()
  statemanager:load()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1, 1)
  --love.mouse.setVisible(false)
end

function love.update(dt)
  mx = love.mouse.getX() / simpleScale.getScale()
  my = love.mouse.getY() / simpleScale.getScale()
  statemanager:update(dt)
end

function love.draw()
	simpleScale.set()
    statemanager:draw()
	simpleScale.unSet()
  beloved:draw()
  love.graphics.print("FPS " .. love.timer.getFPS())
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
