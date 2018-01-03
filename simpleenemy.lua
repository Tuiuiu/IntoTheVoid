-- Create table containing Simple Enemy functions and attributes
local SE = {}

SE.enemies = {}
local len = 0

-- Local variables
local horizontalXspeed = 100
local speedChanger = 1
local respawn_cooldown = 0
local width = 1024
local heigth = 768

-- Public functions that can be called by the requiring file
function SE.create(x, y)
	local new_enemy = {}
	-- Attributes of the enemy
	new_enemy.x = x
	new_enemy.y = y

	len = len + 1
	table.insert(SE.enemies, len, new_enemy)
end

local function off_respawn()
	if respawn_cooldown == 0 then
		respawn_cooldown = 400
		return true
	else
		return false
	end
end

function SE.update(dt)
	if respawn_cooldown ~= 0 then
		respawn_cooldown = respawn_cooldown - 1
	end

	if love.keyboard.isDown("p") then
		if off_respawn() then
			local randx = love.math.random(100, width - 100)
			local randy = love.math.random(100, heigth - 100)
			SE.create(randx, randy)
		end 
	end

	if horizontalXspeed >= 100 and speedChanger == 1 then
		speedChanger = -1
	elseif horizontalXspeed <= -100 and speedChanger == -1 then
		speedChanger = 1
	end

	horizontalXspeed = horizontalXspeed + speedChanger * dt * 50

	local i = 1
	while i <= len do
		local enemy = SE.enemies[i]
		enemy.x = enemy.x + horizontalXspeed * dt
		i = i + 1
	end
end 

function SE.draw()
	love.graphics.setColor(255, 140, 0)
	for j = 1, len, 1 do
		love.graphics.rectangle("fill", SE.enemies[j].x, SE.enemies[j].y, 50, 50)
	end
end

-- Return Simple Enemy table, making it usable for the files that require it
return SE