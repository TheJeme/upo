require 'states/maingame'
require 'states/mainmenu'

statemanager = {}

local currentState

function statemanager:load()
  currentState = "menu"
  mainmenu:load()
  maingame:load()
end

function statemanager:update(dt)
  if (currentState == "game") then
    maingame:update(dt)
  elseif (currentState == "menu") then
    mainmenu:update(dt)
  end
end

function statemanager:draw()
  if (currentState == "game") then
    maingame:draw()
  elseif (currentState == "menu") then
    mainmenu:draw()
  end
end

function statemanager:mousepressed(x, y, button)
  if (currentState == "game") then
    maingame:mousepressed(x, y, button)
  elseif (currentState == "menu") then
    mainmenu:mousepressed(x, y, button)
  end
end

function statemanager:keypressed(key)
  if (currentState == "game") then
    maingame:keypressed(key)
  elseif (currentState == "menu") then
    mainmenu:keypressed(key)
  end
end

function statemanager:changeState(state)
  currentState = state
end


return statemanager
