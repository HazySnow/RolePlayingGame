General = {}

function General:load()
	self.data = NPC:init("BRUH","General",{166,76,92})
end

function General:draw(x,y)
	love.graphics.setColor(love.math.colorFromBytes(self.data.color))
	love.graphics.print('/', x * Game.scale, y * Game.scale)
end
