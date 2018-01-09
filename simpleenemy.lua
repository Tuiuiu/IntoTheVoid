-- Simple enemy Class
SE = {}

-- Public functions that can be called by the requiring file
function SE:create(x, y)
	local enm = {}
	setmetatable(enm, self)
	self.__index = self
	
	-- Object attributes
	enm.x = x
	enm.y = y
	enm.horizontalXspeed = 100
	enm.speedChanger = 1
	return enm
end

function SE:update(dt)
	if self.horizontalXspeed >= 100 and self.speedChanger == 1 then
		self.speedChanger = -1
	elseif self.horizontalXspeed <= -100 and self.speedChanger == -1 then
		self.speedChanger = 1
	end

	self.horizontalXspeed = self.horizontalXspeed + self.speedChanger * dt * 50

	self.x = self.x + self.horizontalXspeed * dt
end 

function SE:draw()
	love.graphics.setColor(255, 140, 0)
	love.graphics.rectangle("fill", self.x, self.y, 50, 50)
end

-- Return Simple Enemy class table, making it usable for the files that require it
return SE