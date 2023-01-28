NPC = Class()

local str = ""

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
	local font = love.graphics.getFont()
	local font_width = font:getWidth(self.dialogue)
	local font_height = font:getHeight(self.dialogue)
	local padding = 8
	local box_x = (Game.width / 2) - (font_width / 2)
	local box_y = ((Game.height - 20) - (font_height / 8))
	love.graphics.setColor(love.math.colorFromBytes(self.color))
	love.graphics.print(self.char, self.x * Game.scale, self.y * Game.scale)

	if self.interacting then
		love.graphics.setColor(1,1,1,100)
		love.graphics.rectangle('fill', box_x - padding, Game.height - 20, font_width + (padding * 2), font_height)
		love.graphics.setColor(love.math.colorFromBytes(self.color))
		love.graphics.print(self.dialogue, (Game.width / 2) - (font_width / 2), Game.height - 20)
	end
end

function NPC:interact()
	if (self.interacting == false) then
		self.interacting = true
	else
		self.interacting = false
	end
end
