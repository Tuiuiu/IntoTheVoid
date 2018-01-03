-- Create table containing Player functions and attributes
local Player = {}

Pistol = require "pistol"

function Player.load()
	shot_delay = 0

	Player.x = love.graphics.getWidth() / 2
	Player.y = love.graphics.getHeight() / 2
end

local function offCooldown()
	if shot_delay == 0 then
		shot_delay = 200
		return true
	else
		return false
	end
end

function Player.update(dt)
	if shot_delay ~= 0 then
		shot_delay = shot_delay - 1
	end

	if love.keyboard.isDown("left") then
		Player.x = Player.x - 150 * dt
	end

	if love.keyboard.isDown("right") then 
		Player.x = Player.x + 150 * dt
	end

	if love.keyboard.isDown("up") then
		Player.y = Player.y - 150 * dt
	end

	if love.keyboard.isDown("down") then 
		Player.y = Player.y + 150 * dt
	end

	if love.keyboard.isDown("w") then
		if offCooldown() then
			Pistol.shoot(Player.x + 17, Player.y + 17, 0, -2000)
		end
	end

	if love.keyboard.isDown("a") then
		if offCooldown() then
			Pistol.shoot(Player.x + 17, Player.y + 17, -2000, 0)
		end
	end

	if love.keyboard.isDown("s") then
		if offCooldown() then
			Pistol.shoot(Player.x + 17, Player.y + 17, 0, 2000)
		end
	end

	if love.keyboard.isDown("d") then
		if offCooldown() then
			Pistol.shoot(Player.x + 17, Player.y + 17, 2000, 0)
		end
	end

	Pistol.update(dt)
end

function Player.draw()
	love.graphics.setColor(148, 0, 211)
	love.graphics.rectangle("fill", Player.x, Player.y, 50, 50)
	Pistol.draw()
end

return Player