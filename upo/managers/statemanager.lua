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


return statemanager
