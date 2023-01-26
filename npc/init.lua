NPC = Class()

function NPC:init(name,x,y,color,char,dialogue)
	self.name = name
	self.x = x
	self.y = y
	self.color = color
	self.char = char
	self.dialogue = dialogue
	self.interacting = false
end

function NPC:draw()
	love.graphics.setColor(love.math.colorFromBytes(self.color))
	love.graphics.print(self.char, self.x * Game.scale, self.y * Game.scale)

	if self.interacting then
		love.graphics.setColor(1,1,1,1)
		love.graphics.print(self.dialogue, (1280/2), (720/2))
	end
end

function NPC:interact()
	if (self.interacting == false) then
		self.interacting = true
	else
		self.interacting = false
	end
end
