background = {}

platform = {}

player = {}

obstacle = {}
 
function love.load()
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
	platform.y = platform.height / 1.1
	platform.img = love.graphics.newImage("ground-seamless-levels-game-earth-surfaces-with-land-grass-dried-soil-water-ice-lava_176411-1062.jpg")

	background.img = love.graphics.newImage("rain.jpg")

	obstacle.x = 480
    obstacle.y = love.graphics.getHeight() / 1.3

    obstacle.img = love.graphics.newImage("purple.png")


    player.x = love.graphics.getWidth() / 1.1
    player.y = love.graphics.getHeight() / 1.1
    
    player.speed = 180

    player.img = love.graphics.newImage("purple.png")

    player.ground = player.y
 
	player.y_velocity = 0
 
	player.jump_height = -300
	player.gravity = -500
end

function love.update(dt)
    if love.keyboard.isDown("d") then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown("a") then
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end
 
	if love.keyboard.isDown("w") then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end
 
	if player.y_velocity ~= 0 then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - player.gravity * dt
	end
 
	if player.y > player.ground then
		player.y_velocity = 0
    	player.y = player.ground
	end
end

function love.draw()
    love.graphics.draw(background.img, background.x, background.y, 0, 1, 2, 0, 100)
	love.graphics.draw(platform.img, platform.x, platform.y, 0, 2, 1, 5)
 
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)

	love.graphics.draw(obstacle.img, obstacle.x, obstacle.y, 0, 1, 1, 0, 32)

end
