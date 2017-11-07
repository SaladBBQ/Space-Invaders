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
	player.bullets = {}
	player.fire = 
	function()
		bullet = {}
		bullet.x = player.x
		bullet.y = player.y
		table.insert(player.bullets, bullet)
	end

	enemy = {}
	enemy.x = 1
	enemy.y = 1
	enemy.image = love.graphics.newImage('enemy.png')
	
	--Spawns each enemy
	--for i=0, 10 do 
	--	enemy:spawnEnemy(i * 10, 0)
	--end 
	--Enemy
	--function enemy:spawnEnemy(x, y)--end 
end
	


-- Used to update the state of the game every frame 
function love.update(dt)
	-- Allows the player to move left and right
	if love.keyboard.isDown("right") then
		player.x = player.x + 1
	elseif love.keyboard.isDown("left") then
		player.x = player.x - 1
	end

	if love.keyboard.isDown("up") then
		player.fire()
	end

	for _,b in pairs(player.bullets) do
		b.y = b.y - 1
	end
end


-- Used to draw on the screen every frame 
function love.draw()
	-- Scales  all graphics by input entered
	love.graphics.scale(6)

	-- Player Style 
	love.graphics.setColor(255, 255, 225)
	love.graphics.draw(player.image, player.x, player.y)

	-- Bullet Styles
	love.graphics.setColor(255, 0, 0)
	for _,b in pairs(player.bullets) do
		love.graphics.rectangle("fill", b.x, b.y, 10, 10)
	end

	-- Enemy Style
	love.graphics.setColor(255, 255, 225)
	love.graphics.draw(enemy.image, enemy.x, enemy.y)
end
