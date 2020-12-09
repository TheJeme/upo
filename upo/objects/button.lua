local button = {}
button.__index = button

function newButton(x, y, width, height, func, func2)
  local b = {}
  b.x = x
  b.y = y
  b.width = width
  b.height = height
  b.func = func
  b.func2 = func2 or function() end
  b.hover = false
  
  return setmetatable(b, button)
end

function button:update(dt)    
  self.isMouseOnButton = mx > self.x and mx < self.x + self.width and
                          my > self.y and my < self.y + self.height                                       
  if self.isMouseOnButton then
    self.hover = true
  else
    self.hover = false
  end
end

function button:mousepressed(x, y, button)
  if self.isMouseOnButton and button == 1 then
    self.func()
  elseif self.isMouseOnButton and button == 2 then
    self.func2()
  end
end

function button:getHoverState()
  return self.hover
end
