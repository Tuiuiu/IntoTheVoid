player = {}
SE = require "simpleenemy"
Pistol = require "pistol"

function love.load()
	love.window.setMode(1024, 768)
	love.window.setTitle("Into the Void")

	shot_delay = 0


	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2

	SE.create(600,300)
end

local function offCooldown()
	if shot_delay == 0 then
		shot_delay = 200
		return true
	else
		return false
	end
end

function love.update(dt)
	if shot_delay ~= 0 then
		shot_delay = shot_delay - 1
	end

	if love.keyboard.isDown("left") then
		player.x = player.x - 150 * dt
	end

	if love.keyboard.isDown("right") then 
		player.x = player.x + 150 * dt
	end

	if love.keyboard.isDown("up") then
		player.y = player.y - 150 * dt
	end

	if love.keyboard.isDown("down") then 
		player.y = player.y + 150 * dt
	end

	if love.keyboard.isDown("w") then
		if offCooldown() then
			Pistol.shoot(player.x + 17, player.y + 17, 0, -2000)
		end
	end

	if love.keyboard.isDown("a") then
		if offCooldown() then
			Pistol.shoot(player.x + 17, player.y + 17, -2000, 0)
		end
	end

	if love.keyboard.isDown("s") then
		if offCooldown() then
			Pistol.shoot(player.x + 17, player.y + 17, 0, 2000)
		end
	end

	if love.keyboard.isDown("d") then
		if offCooldown() then
			Pistol.shoot(player.x + 17, player.y + 17, 2000, 0)
		end
	end

	SE.update(dt)
	Pistol.update(dt)
end

function love.draw()
	love.graphics.setColor(148, 0, 211)
	love.graphics.rectangle("fill", player.x, player.y, 50, 50)
	SE.draw()
	Pistol.draw()
end

