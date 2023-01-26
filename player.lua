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

function Player:door_transition(room_width, room_height, xvel, yvel)
	-- If player is moving right then place player on left side of next room
	if (xvel == 1) then
		Game.currentRoomX = Game.currentRoomX + 1
		self.x = 2
	elseif (xvel == -1) then
		Game.currentRoomX = Game.currentRoomX - 1
		self.x = room_width - 1
	end

	if (yvel == 1) then
		Game.currentRoomY = Game.currentRoomY + 1
		self.y = 2
	elseif (yvel == -1) then
		Game.currentRoomY = Game.currentRoomY - 1
		self.y = room_height - 1
	end
end

function Player:keypressed(key)
	-- Get the current room
	local current_room = World.world[Game.currentRoomY][Game.currentRoomX].room
	local current_room_width, current_room_height = World.world[Game.currentRoomY][Game.currentRoomX].width, World.world[Game.currentRoomY][Game.currentRoomX].height
	local moveX, moveY

	if (key == 'd') then
		moveX = 1
	elseif (key == 'a') then
		moveX = -1
	else
		moveX = 0
	end

	if (key == 'w') then
		moveY = -1
	elseif (key == 's') then
		moveY = 1
	else
		moveY = 0
	end

	-- Handle Movement

	-- CLEAN CODE

	-- Check if moving in x axis
	if (moveX ~= 0) then
		-- Check for collisions
		local moving_to = current_room[self.y][self.x+moveX]

		-- If the player is going to collide with the door
		if (moving_to == 3) then
			-- Find out if player is moving left or right and move player accordingly
			self:door_transition(current_room_width, current_room_height , moveX, moveY)
		elseif (moving_to == 0) then
			self.x = self.x + moveX
		end
	end

	-- Check if moving in y axis
	if (moveY ~= 0) then
		local moving_to = current_room[self.y+moveY][self.x]

		-- Door collision
		if (moving_to == 3) then
			self:door_transition(current_room_width, current_room_height , moveX, moveY)
		elseif (moving_to == 0) then
			self.y = self.y + moveY
		end
	end
	
end

function love.keypressed(key)
	Player:keypressed(key)
end
