Merchant = {}

function Merchant:load()
	self.data = NPC:init("BRUH", "Merchant", {143,181,103})
end

function Merchant:draw(x,y)
	love.graphics.setColor(love.math.colorFromBytes(self.data.color))
	love.graphics.print('>', x * Game.scale, y * Game.scale)
end
