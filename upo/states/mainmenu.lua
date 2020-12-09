mainmenu = {}

function mainmenu:load()

end

function mainmenu:update(dt)

end

function mainmenu:draw()
  love.graphics.setBackgroundColor(25 / 255, 25 / 255, 25 / 255, 1)
  love.graphics.setColor(85 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw/2, gh/2, 450)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(5)
  love.graphics.circle("line", gw/2, gh/2, 450)
  love.graphics.printf("upo", 0, gh*0.27, gw, "center")

  love.graphics.setColor(0.1, 0.1, 0.1, 0.17)
  love.graphics.rectangle('fill', gw*0.4, gh*0.48, gw*0.2, gh*0.1)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Play", 0, gh*0.52, gw, "center")
  love.graphics.setColor(0.1, 0.1, 0.1, 0.17)
  love.graphics.rectangle('fill', gw*0.4, gh*0.58, gw*0.2, gh*0.1)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Options", 0, gh*0.62, gw, "center")
  love.graphics.setColor(0.1, 0.1, 0.1, 0.17)
  love.graphics.rectangle('fill', gw*0.4, gh*0.68, gw*0.2, gh*0.1)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Quit", 0, gh*0.72, gw, "center")
end

function mainmenu:menuButtons()
  love.graphics.setColor(85 / 255, 105 / 255, 255 / 255, 1)
  love.graphics.circle("fill", gw/2, gh*0.5, 180)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw/2, gh*0.5, 180)
  love.graphics.printf("Play", gw/2-140, gh*0.5, 140*2, "center")

  love.graphics.setColor(255 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw/2, gh*0.8, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw/2, gh*0.8, 100)
  love.graphics.printf("Quit", gw/2-140, gh*0.8, 140*2, "center")

  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.38, gh*0.7, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.38, gh*0.7, 100)
  love.graphics.printf("Resolution", gw*0.38-140, gh*0.7-10, 140*2, "center")
  love.graphics.printf("1920x1080", gw*0.38-140, gh*0.7+10, 140*2, "center")

  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.62, gh*0.7, 100)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.62, gh*0.7, 100)
  love.graphics.printf("Volume", gw*0.62-140, gh*0.7-10, 140*2, "center")
  love.graphics.printf("100%", gw*0.62-140, gh*0.7+10, 140*2, "center")
end

function mainmenu:quitButton()
  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.59 - 80, gh*0.625, 70)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.59 - 80, gh*0.625, 70)
  love.graphics.printf("Yes", gw*0.59-140, gh*0.6, 140*2, "center")

  love.graphics.setColor(255 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.59 + 80, gh*0.625, 70)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.59 + 80, gh*0.625, 70)
  love.graphics.printf("No", gw*0.59-140, gh*0.6, 140*2, "center")
end

function mainmenu:optionsButton()
  love.graphics.setColor(85 / 255, 255 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.41 - 80, gh*0.625, 70)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.41 - 80, gh*0.625, 70)
  love.graphics.printf("Resolution: 1920x1080", gw*0.425-140, gh*0.6, 140*2, "center")

  love.graphics.setColor(255 / 255, 105 / 255, 145 / 255, 1)
  love.graphics.circle("fill", gw*0.425 + 80, gh*0.625, 70)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("line", gw*0.425 + 80, gh*0.625, 70)
  love.graphics.printf("Volume: 1.0x", gw*0.425-140, gh*0.6, 140*2, "center")
end

return mainmenu
