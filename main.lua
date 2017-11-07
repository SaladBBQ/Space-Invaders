--[[
	Simple Space Invaders Game Developed by BBQ_Salad!
]]

--Global 
love.graphics.setDefaultFilter('nearest','nearest')




-- Loaded at the start of the game
function love.load()
	--Player 
	player = {}
	player.x = 0
	player.y = 89
	player.image = love.graphics.newImage('player.png')
	
	--Bullets 


	
	--Spawns each enemy
	for i=0, 10 do 
		enemy:spawnEnemy(i * 10, 0)
	end 
end
	--Enemy
	function enemy:spawnEnemy(x, y)
		enemy = {}
		enemy.x = 1
		enemy.y = 1
		enemy.image = love.graphics.newImage('enemy.png')
	 end 


-- Used to update the state of the game every frame 
function love.update(dt)
	-- Allows the player to move left and right
	if love.keyboard.isDown("right") then
		player.x = player.x + 1
	elseif love.keyboard.isDown("left") then
		player.x = player.x - 1
	end
end


-- Used to draw on the screen every frame 
function love.draw()
	--Scales  all graphics by input entered
	love.graphics.scale(6)

	--Player Style 
	love.graphics.setColor(255, 255, 225)
	love.graphics.draw(player.image, player.x, player.y)


	--Enemy Style
	for _, e in pairs(spawnEnemy) do  
	love.graphics.setColor(255, 255, 225)
	love.graphics.draw(enemy.image, enemy.x, enemy.y)


end
