Class = require 'lib/30log'

NPC = Class()

function NPC:init(name,x,y,color,char)
	self.name = name
	self.x = x
	self.y = y
	self.color = color
	self.char = char

	-- When NPC is made change the value of the npc's x and y position
	-- in the array to something that isnt 0
end

function NPC:draw()
	love.graphics.setColor(love.math.colorFromBytes(self.color))
	love.graphics.print(self.char, self.x * Game.scale, self.y * Game.scale)
end
