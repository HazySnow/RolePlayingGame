require 'npc/init'
require 'world/room_1'
require 'world/room_2'
require 'world/room_3'

World = {}

function World:load()
	Room_1:load()
	Room_2:load()
	Room_3:load()

	self.world = {
		{Room_2, Room_1},
		{Room_3}
	}
	
end
