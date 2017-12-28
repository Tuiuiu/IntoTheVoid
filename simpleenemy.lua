-- Create table containing Simple Enemy functions and attributes
local SE = {}

SE.x = nil
SE.y = nil

local horizontalXspeed = 100
local speedChanger = 1

function SE.create(x, y)
	SE.x = x
	SE.y = y
end

function SE.update(dt)

	if horizontalXspeed >= 100 and speedChanger == 1 then
		speedChanger = -1
	elseif horizontalXspeed <= -100 and speedChanger == -1 then
		speedChanger = 1
	end

	horizontalXspeed = horizontalXspeed + speedChanger * dt * 50

	SE.x = SE.x + horizontalXspeed * dt
	print (horizontalXspeed .. " speedChanger eh " .. speedChanger)
end 


function SE.draw()
	love.graphics.setColor(255, 140, 0)
	love.graphics.rectangle("fill", SE.x, SE.y, 50, 50)
end

-- Return Simple Enemy table, making it usable for the files that require it
return SE