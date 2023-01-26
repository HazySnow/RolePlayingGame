NPC = {}

function NPC:init(x,y,dialogue,name,color)
	local data = {}
	data.x = x
	data.y = y
	data.dialogue = dialogue
	data.name = name
	data.color = color
	return data
end
