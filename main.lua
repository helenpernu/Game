
local isGameOver = false

background = {}

platform = {}

dementors = {}

goldensnitchScore = {}

harry = {}

local score = 0



function love.load()
	dementors.x  = love.math.random(400)
    dementors.y = 0
    dementors.width = 0.28
    dementors.height = 0.28
    dementors.speed = 210
	dementors.img = love.graphics.newImage("dementorpixel.png")

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
	platform.x = 0
	platform.y = platform.height / 1.1
	platform.img = love.graphics.newImage("platform.jpg")

	goldensnitchScore.x = love.math.random(200)
	goldensnitchScore.y = 0
    goldensnitchScore.width = 0.087
    goldensnitchScore.height = 0.087
    goldensnitchScore.speed = 200
	goldensnitchScore.img = love.graphics.newImage("goldensnitch.png")

	background.img = love.graphics.newImage("rain.jpg")

    harry.x = love.graphics.getWidth() / 1.1
    harry.y = love.graphics.getHeight()
    harry.width = 25
    harry.height = 25.1
    harry.speed = 350
	harry.img = love.graphics.newImage("harry-potter.png")
	

end


-- dementors
function dementors:collide()
    if checkCollision(harry, dementors) then
        dementors.speed = 0
    end
end

-- golden snitch
function goldensnitchScore:collide()
    if checkCollision(harry, goldensnitchScore) then
        goldensnitchScore.speed = 0
	else scoreDraw()
		
		
    end
end


function love.update(dt)

-- dementors
	dementors.y = dementors.y + (dementors.speed * dt)

	if(checkCollision(harry, dementors)) then
        isGameOver = true
    	end

	if(dementors.y > love.graphics.getHeight()) then
		dementors.y = -100
		dementors.x = math.random(50, love.graphics.getWidth() - 50)
		dementors.speed = dementors.speed + 40
		end

-- golden snitch
	goldensnitchScore.y = goldensnitchScore.y + (goldensnitchScore.speed * dt)

	if(checkCollision(harry, goldensnitchScore)) then
		score =  score + 150

		end
	
	if(goldensnitchScore.y > love.graphics.getHeight()) then
			goldensnitchScore.y = -50
			goldensnitchScore.x = math.random(50, love.graphics.getWidth() - 25)
			goldensnitchScore.speed = goldensnitchScore.speed + 20
			
			
		end

--harry
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
    
	if love.keyboard.isDown("escape") then
        love.event.quit()
    elseif love.keyboard.isDown("r") then
        love.event.quit("restart")
    end

end

function love.draw()
	love.graphics.draw(background.img, background.x, background.y, 0, 1, 2, 0, 100)
	love.graphics.draw(platform.img, platform.x, platform.y, 0, 2, 1, 5)

	if isGameOver == false then
	love.graphics.draw(dementors.img, dementors.x , dementors.y, dementors.height, dementors.width)
	love.graphics.draw(harry.img, harry.x, harry.y, harry.height)
	love.graphics.draw(goldensnitchScore.img, goldensnitchScore.x, goldensnitchScore.y, goldensnitchScore.height, goldensnitchScore.width)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print("Score: ", 10, 10, 0, 2)
	love.graphics.print(score, 100, 10, 0, 2)
	end
	


	if(isGameOver) then 
        local font = love.graphics.newFont(40)
        love.graphics.setFont(font)
        local text = "OH NO! GAME OVER..."
        love.graphics.print(text, love.graphics.getWidth() / 2 - font:getWidth(text) / 2, love.graphics.getHeight() * (1 / 3))
		love.graphics.print("Your score:" .. " " .. score, love.graphics.getWidth() / 1, love.graphics.getHeight() / 1, 0, 2)
        return
    end
 
	
    
end
 

-- dementors + harry
function checkCollision(harry, dementors)
    if harry.x + harry.width > dementors.x and harry.x < dementors.x + dementors.width and harry.y + harry.height > dementors.y and harry.y < dementors.y + dementors.height then
         return true
	else
		return false
    end
end

-- harry + golden snitch
function checkCollision(harry, goldensnitchScore)
    if harry.x + harry.width > goldensnitchScore.x and harry.x < goldensnitchScore.x + goldensnitchScore.width and harry.y + harry.height > goldensnitchScore.y and harry.y < goldensnitchScore.y + goldensnitchScore.height then
         return true
	else
		return false
    end

end

