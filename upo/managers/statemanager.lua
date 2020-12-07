require 'states/maingame'
require 'states/mainmenu'

statemanager = {}

function statemanager:load()
  maingame:load()
end

function statemanager:update(dt)
  if (1 == 1) then
    maingame:update(dt)
  end
end

function statemanager:draw()
  if (1 == 1) then
    maingame:draw()
  end
end

return statemanager
