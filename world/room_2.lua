require 'world/room_init'

local layout = {
	{2,2,2,2,2,2},
	{2,0,0,0,0,2},
	{2,0,0,0,0,3},
	{2,0,0,0,0,3},
	{2,0,0,0,0,2},
	{2,2,3,3,2,2}
}

local npc = {}


Room_2 = Room(6,6,layout,npc)
