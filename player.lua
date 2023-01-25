Player = {}

function Player:load()
	self.x = 4
	self.y = 3
end

function Player:update(dt)
end

function Player:draw()
	love.graphics.setColor(1,1,1,1)
	love.graphics.print('@', self.x * Game.scale, self.y * Game.scale)
end

function Player:keypressed(key)
	-- Handle Movement

	-- Right Movement
	if key == 'd' then
		-- Checking if something is in the way
		if Game.world[self.x+1][self.y] == 0 then
			self.x = self.x + 1
		end
	end

	-- Left Movement
	if key == 'a' then
		-- Checking if something is in the way	
		if Game.world[self.x-1][self.y] == 0 then
			self.x = self.x - 1
		end
	end

	-- Up Movement
	if key == 'w' then
		-- Checking if something is in the way
		if Game.world[self.x][self.y-1] == 0 then
			self.y = self.y - 1
		end
	end

	-- Down Movement
	if key == 's' then
		-- Checking if something is in the way
		if Game.world[self.x][self.y+1] == 0  then
			self.y = self.y + 1
		end
	end
end

function love.keypressed(key)
	Player:keypressed(key)
end
