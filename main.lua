Player = require "player"
SE = require "simpleenemy"

function love.load()
	love.window.setMode(1024, 768)
	love.window.setTitle("Into the Void")

	Player.load()
	SE.create(600,300)
end

function love.update(dt)
	Player.update(dt)
	SE.update(dt)
end

function love.draw()
	Player.draw()
	SE.draw()
end

