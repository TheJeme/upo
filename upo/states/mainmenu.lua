mainmenu = {}

function mainmenu:load()

end

function mainmenu:update(dt)

end

function mainmenu:draw()
  love.graphics.setBackgroundColor(25 / 255, 25 / 255, 25 / 255, 1)
  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw/2, 0, 450)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(5)
  love.graphics.circle("line", gw/2, 0, 450)
  love.graphics.printf("upo", 0, gh*0.15, gw, "center")

  mainmenu:menuButtons()
  mainmenu:quitButton()
  mainmenu:optionsButton()
end

function mainmenu:menuButtons()
  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.23, gh*0.55, 250)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.23, gh*0.55, 250)
  love.graphics.printf("Quit", gw*0.23 - 140, gh*0.55, 140*2, "center")

  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.5, gh*0.65, 250)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.5, gh*0.65, 250)
  love.graphics.printf("Play", gw*0.5-140, gh*0.65, 140*2, "center")

  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.78, gh*0.55, 250)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.78, gh*0.55, 250)
  love.graphics.printf("Options", gw*0.78-140, gh*0.55, 140*2, "center")
end

function mainmenu:quitButton()
  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.25 - 90, gh*0.55, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.25 - 90, gh*0.55, 100)
  love.graphics.printf("Yes", gw*0.25-160, gh*0.55, 160, "center")

  love.graphics.setColor(255 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.25 + 90, gh*0.55, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.25 + 90, gh*0.55, 100)
  love.graphics.printf("No", gw*0.25-160, gh*0.55, 160, "center")
end

function mainmenu:optionsButton()
  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.75 - 90, gh*0.55, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.75 - 90, gh*0.55, 100)
  love.graphics.printf("Resolution", gw*0.75-250, gh*0.53, 160*2, "center")
  love.graphics.printf("1920x1080", gw*0.75-250, gh*0.53+20, 160*2, "center")

  love.graphics.setColor(255 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.75 + 90, gh*0.55, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.75 + 90, gh*0.55, 100)
  love.graphics.printf("Volume", gw*0.75+250, gh*0.55, 160*2, "center")
  love.graphics.printf("100", gw*0.75+250, gh*0.55+20, 160*2, "center")
end

return mainmenu
