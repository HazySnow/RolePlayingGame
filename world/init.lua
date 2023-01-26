require 'world/room_1'
require 'world/room_2'
require 'world/room_3'

World = {}

function World:load()
	self.world = {
		{Room_2, Room_1},
		{Room_3}
	}
end
