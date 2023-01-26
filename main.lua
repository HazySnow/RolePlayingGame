require 'player'
require 'world/room_1'
require 'world/room_2'

Game = {}

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	Room_1:load()
	Room_2:load()

	Game.room_3 = {
		{2,2,3,3,2,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,2,2,2,2,2}
	}
	
	Game.world = {
		{Room_2, Room_1},
		{Game.room_3}
	}
	Game.currentRoomX = 2
	Game.currentRoomY = 1
	Game.scale = 15
	Player:load()
end

function love.update(dt)
end

function love.draw()

	-- Choosing the current room
	local room = Game.world[Game.currentRoomY][Game.currentRoomX]
	local room_layout = room.room
	local width, height = room.width, room.height

	for y = 1, height, 1 do
		for x = 1, width, 1 do 
			drawing_world(room_layout,x,y)
		end
	end
end

function drawing_world(room,x,y)
	-- Setting colors
	local wall = {78,136,173}

	local unit = room[y][x]
	if unit == 2 then
		love.graphics.setColor(love.math.colorFromBytes(wall))
		love.graphics.print('#', x * Game.scale, y * Game.scale)
	elseif unit == 0 then
		love.graphics.setColor(1,1,1,0.3)
		love.graphics.print('.', x * Game.scale, y * Game.scale)
	elseif unit == 3 then
		if (y == 1 or y == 6) then
			love.graphics.setColor(love.math.colorFromBytes(wall))
			love.graphics.print('-', x * Game.scale, y * Game.scale)
		else
			love.graphics.setColor(love.math.colorFromBytes(wall))
			love.graphics.print('|', x * Game.scale, y * Game.scale)
		end
	end

	Player:draw()
end
