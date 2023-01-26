General = {}

function General:load()
	self.data = NPC:init(2,2,"BRUH","General",{166,76,92})
end

function General:draw()
	love.graphics.setColor(love.math.colorFromBytes(self.data.color))
	love.graphics.print('/', self.data.x * Game.scale, self.data.y * Game.scale)
end
