Player = require "player"
-- SE = require "simpleenemy"
Lvl = require "level"

function love.load()
	love.window.setMode(1024, 768)
	love.window.setTitle("Into the Void")

	Player.load()
	Lvl.create()
	-- SE.create(600,300)
end

function love.update(dt)
	Player.update(dt)
	Lvl.update(dt)
end

function love.draw()
	Player.draw()
	Lvl.draw()
end

