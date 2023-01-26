require 'npc/npc_1'

Room_2 = {}

function Room_2:load()
	self.room = {
		{2,2,2,2,2,2,2,2},
		{2,0,0,0,0,0,0,2},
		{2,0,0,0,0,0,0,3},
		{2,0,0,0,0,0,0,3},
		{2,0,0,0,0,0,0,2},
		{2,2,3,3,2,2,2,2}
	}
	self.width = 8
	self.height = 6
	self.npc_list = {General}
end
