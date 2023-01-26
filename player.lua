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
	-- Get the current room
	local current_room = Game.world[Game.currentRoomY][Game.currentRoomX].room
	local current_room_width, current_room_height = Game.world[Game.currentRoomY][Game.currentRoomX].width, Game.world[Game.currentRoomY][Game.currentRoomX].height

	-- Handle Movement

	-- Right Movement
	if key == 'd' then
		-- Checking if something is in the way
		if current_room[self.y][self.x+1] ~= 2 then
			self.x = self.x + 1
		end

		-- Handle room transtion
		if (current_room[self.y][self.x] == 3) then
			Game.currentRoomX = Game.currentRoomX + 1
			self.x = 2
		end
	end

	-- Left Movement
	if key == 'a' then
		-- Checking if something is in the way	
		if current_room[self.y][self.x-1] ~= 2 then
			self.x = self.x - 1
		end

		-- Handle room transition
		if (current_room[self.y][self.x] == 3) then
			Game.currentRoomX = Game.currentRoomX - 1
			self.x = current_room_width+1
		end
	end

	-- Up Movement
	if key == 'w' then
		-- Checking if something is in the way
		if current_room[self.y-1][self.x] ~= 2 then
			self.y = self.y - 1
		end

		-- Handle room transition
		if (current_room[self.y][self.x] == 3) then
			Game.currentRoomY = Game.currentRoomY - 1
			self.y = 5
		end
	end

	-- Down Movement
	if key == 's' then
		-- Checking if something is in the way
		if current_room[self.y+1][self.x] ~= 2  then
			self.y = self.y + 1
		end

		-- Handle room transition
		if current_room[self.y][self.x] == 3 then
			Game.currentRoomY = Game.currentRoomY + 1
			self.y = 2
		end
	end
end

function love.keypressed(key)
	Player:keypressed(key)
end
