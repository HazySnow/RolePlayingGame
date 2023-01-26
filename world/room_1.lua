require 'npc/guard'
require 'npc/merchant'

Room_1 = {}

function Room_1:load()
	self.room = {
		{2,2,2,2,2,2},
		{2,0,0,0,0,2},
		{3,0,0,0,0,2},
		{3,0,0,0,0,2},
		{2,0,0,0,0,2},
		{2,2,2,2,2,2}
	}
	self.width = 6
	self.height = 6
	self.npc = {Guard, Merchant}

	for i,v in ipairs(self.npc) do
		self.room[v.y][v.x] = 4
	end
end
