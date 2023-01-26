Class = require 'lib/30log'

require 'player'
require 'world/init'
require 'npc/init'

Game = {}

local npc_no

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	World:load()
	
	Game.currentRoomX = 2
	Game.currentRoomY = 1
	Game.scale = 15
	Player:load()	
end

function love.update(dt)
end

function love.draw()

	-- Choosing the current room
	local room = World.world[Game.currentRoomY][Game.currentRoomX]
	local room_layout = room.room
	local width, height = room.width, room.height

	for y = 1, height, 1 do
		for x = 1, width, 1 do 
			drawing_world(room_layout,x,y,room)
		end
	end
end

function drawing_world(room,x,y,room_map)
	-- Setting colors
	local wall = {78,136,173}
	
	
	-- Draw the current Room
	World.world[Game.currentRoomY][Game.currentRoomX]:draw()

	-- Draw the player
	Player:draw()

	-- Draw the NPC
	for i,v in ipairs(room_map.npc) do
		v:draw()
	end

end
