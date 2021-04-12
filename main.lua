
local isGameOver = false

background = {}

platform = {}

dementors = {}

harry = {}



function love.load()
	dementors.x  = love.math.random(400)
    dementors.y = 0
    dementors.width = 1
    dementors.height = 1
    dementors.speed = 200

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
	platform.x = 0
	platform.y = platform.height / 1.1
	platform.img = love.graphics.newImage("platform.jpg")

	dementors.img = love.graphics.newImage("dementor.png")

	background.img = love.graphics.newImage("rain.jpg")

    harry.x = love.graphics.getWidth() / 1.1
    harry.y = love.graphics.getHeight()
    harry.width = 25  -- player bredd
    harry.height = 25 -- player höjd
    harry.speed = 300 -- player hastighet

	harry.img = love.graphics.newImage("harry-potter.png")
	

end

function dementors:collide()
    if checkCollision(self, dementors) then
        dementors.speed = 0
    end
end


function love.update(dt)

	dementors.y = dementors.y + (dementors.speed * dt)

	if(checkCollision(harry, dementors)) then
        isGameOver = true 
    end

	if(dementors.y > love.graphics.getHeight()) then
		dementors.y = -100
		dementors.x = math.random(50, love.graphics.getWidth() - 50)
		dementors.speed = dementors.speed + 40
		end


	if harry.y < 0 + 100 then 
        harry.y = 0 + 100 elseif
        harry.y + 100 > love.graphics.getHeight() 
    then harry.y = love.graphics.getHeight() - 100
    end

	if harry.x < 0 + 0        
    then harry.x = 0 + 700 
    elseif harry.x + 0 > love.graphics.getWidth() 
    then harry.x = love.graphics.getWidth() -700
    end

	
	
    if love.keyboard.isDown("d") 
    then harry.x = harry.x + harry.speed * dt
    end
    
    
    if love.keyboard.isDown("a")
    then harry.x = harry.x - harry.speed * dt
    end
    

end

function love.draw()
	love.graphics.draw(background.img, background.x, background.y, 0, 1, 2, 0, 100)
	love.graphics.draw(platform.img, platform.x, platform.y, 0, 2, 1, 5)

	if isGameOver == false then
	love.graphics.draw(dementors.img, dementors.x , dementors.y, dementors.height, dementors.width)
	love.graphics.draw(harry.img, harry.x, harry.y, harry.height)
	end


	if(isGameOver) then 
        local font = love.graphics.newFont(40)
        love.graphics.setFont(font)
        local text = "OH NO! GAME OVER..."
        love.graphics.print(text, love.graphics.getWidth() / 2 - font:getWidth(text) / 2, love.graphics.getHeight() * (1 / 3))
        return
    end
 
    
end
 
function checkCollision(harry, dementors)
    if harry.x + harry.width > dementors.x and harry.x < dementors.x + dementors.width and harry.y + harry.height > dementors.y and harry.y < dementors.y + dementors.height then
         return true
	else
		return false
    end


end