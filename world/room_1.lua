require 'npc/guard'
require 'npc/merchant'
require 'world/room_init'

local layout = {
	{2,2,2,2,2,2},
	{2,0,0,0,0,2},
	{3,0,0,0,0,2},
	{3,0,0,0,0,2},
	{2,0,0,0,0,2},
	{2,2,2,2,2,2}
}
local npc = {Guard, Merchant}

Room_1 = Room(6,6,layout,npc)
