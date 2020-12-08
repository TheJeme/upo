mainmenu = {}

function mainmenu:load()

end

function mainmenu:update(dt)

end

function mainmenu:draw()
  love.graphics.setBackgroundColor(45 / 255, 45 / 255, 45 / 255, 1)
  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw/2, gh/2, 350)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw/2, gh/2, 350)
  love.graphics.printf("upo", 0, gh/2, gw, "center")
end

return mainmenu
