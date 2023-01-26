-- Generating Room Class
Room = Class()

function Room:init(width, height, layout, npc)
	self.width = width
	self.height = height
	self.layout = layout
	self.npc = npc

	for i,v in ipairs(npc) do
		layout[v.y][v.x] = 4
	end
end

function Room:draw()
	for y = 1, self.height, 1 do
		for x = 1, self.width, 1 do
			handleDrawing(x,y,self.layout)
		end
	end
end

function handleDrawing(x,y,layout)
	local wall = {78,136,173}
	local floor = {255,255,255,5}

	local unit = layout[y][x]
	if unit == 2 then
		love.graphics.setColor(love.math.colorFromBytes(wall))
		love.graphics.print('#', x * Game.scale, y * Game.scale)
	elseif unit == 0 then
		love.graphics.setColor(love.math.colorFromBytes(floor))
		love.graphics.print('.', x * Game.scale, y * Game.scale)
	elseif unit == 3 then
		if (y == 1 or y == 6) then
			love.graphics.setColor(love.math.colorFromBytes(wall))
			love.graphics.print('-', x * Game.scale, y * Game.scale)
		else
			love.graphics.setColor(love.math.colorFromBytes(wall))
			love.graphics.print('|', x * Game.scale, y * Game.scale)
		end
	end
end
