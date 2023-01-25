require 'player'

Game = {}

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	Game.world = {
		{2,2,2,2,2,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,2,2,2,2,2}
	}
	Game.scale = 15
	Player:load()
end

function love.update(dt)
end

function love.draw()
	for y = 1, 6, 1 do
		for x = 1, 6, 1 do
			drawing_world(x,y)
		end
	end
end

function drawing_world(x,y)
	-- Setting colors
	local wall = {78,136,173}

	local unit = Game.world[x][y]
	if unit == 2 then
		love.graphics.setColor(love.math.colorFromBytes(wall))
		love.graphics.print('#', x * Game.scale, y * Game.scale)
	elseif unit == 0 then
		love.graphics.setColor(1,1,1,0.3)
		love.graphics.print('.', x * Game.scale, y * Game.scale)
	end

	Player:draw()
end
