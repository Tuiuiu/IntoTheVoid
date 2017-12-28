-- Pistol would be a weapon in the game. It may be part of an Arsenal or something like that.
-- The player will pick weapons during the game that would be equipped instantly. Each weapon
-- has its own properties, like damage, projectile trajectory, ammunition and other possible 
-- properties.  

-- Create table containing Pistol weapon functions and attributes
local Pistol = {}

Pistol.projectiles = {}
local len = 0

-- Local functions

-- Public functions
function Pistol.shoot(x, y, velx, vely)
	local new_shot = {}
	new_shot.x = x
	new_shot.y = y
	new_shot.velx = velx
	new_shot.vely = vely

	len = len + 1
	table.insert(Pistol.projectiles, len, new_shot)
end

function Pistol.update(dt)
	local i = 1
	while i <= len do
		local projectile = Pistol.projectiles[i]
		projectile.x = projectile.x + projectile.velx * dt
		projectile.y = projectile.y + projectile.vely * dt

		if projectile.x > 1100 or projectile.x < -100 
			or projectile.y > 1100 or projectile.y < -100 then
			table.remove(Pistol.projectiles, i)
			len = len - 1
		else
			i = i + 1
		end
	end
end

function Pistol.draw()
	love.graphics.setColor(50, 205, 50)
	for i = 1, len, 1 do
		love.graphics.rectangle("fill", Pistol.projectiles[i].x, Pistol.projectiles[i].y, 15, 15)
	end
end

-- Return Pistol table, making it usable for the files that require it
return Pistol
