SE = require "simpleenemy"

local Level = {}

local player
local len = 0
enemies = {}

local respawn_cooldown = 0

-- Local functions
local function off_respawn()
	if respawn_cooldown == 0 then
		respawn_cooldown = 400
		return true
	else
		return false
	end
end

local function test()
	local SE_test = SE:create(100,200)

	len = len + 1
	table.insert(enemies, len, SE_test)
end

-- Level public functions
function Level.create(Player)
	player = Player	or {}

	test()
end

function Level.update(dt)
	if respawn_cooldown ~= 0 then
		respawn_cooldown = respawn_cooldown - 1
	end

	if love.keyboard.isDown("p") then
		if off_respawn() then
			local randx = love.math.random(100, love.graphics.getWidth() - 100)
			local randy = love.math.random(100, love.graphics.getHeight() - 100)
			local new_enemy = SE:create(randx, randy)

			len = len + 1
			table.insert(enemies, len, new_enemy)
		end 
	end

	local i = 1
	while i <= len do
		enemies[i]:update(dt)
		i = i + 1
	end
end

function Level.draw()
	for j = 1, len, 1 do
		enemies[j]:draw()
	end
end

return Level


