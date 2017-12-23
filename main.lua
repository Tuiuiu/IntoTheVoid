player = {}

function love.load()
	love.window.setMode(1024, 768)
	love.window.setTitle("Into the Void")

	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2
end

function love.update(dt)
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
end

function love.draw()
	love.graphics.setColor(148, 0, 211)
	love.graphics.rectangle("fill", player.x, player.y, 50, 50)
end