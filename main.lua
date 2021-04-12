
local isGameOver = false

background = {}

platform = {}

dementors = {}

self = {}



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

    self.x = love.graphics.getWidth() / 1.1
    self.y = love.graphics.getHeight()
    self.width = 25  -- player bredd
    self.height = 25 -- player höjd
    self.speed = 300 -- player hastighet

	self.img = love.graphics.newImage("harry-potter.png")
	

end

function dementors:collide()
    if checkCollision(self, dementors) then
        self.speed = 0
    end
end


function love.update(dt)

	dementors.y = dementors.y + (dementors.speed * dt)

	if(checkCollision(self, dementors)) then
        isGameOver = true   -- boolean updateras
    end


	if self.y < 0 + 100 then 
        self.y = 0 + 100 elseif
        self.y + 100 > love.graphics.getHeight() -- boundaries upp och ner, så playern inte kan rymma kartan
    then self.y = love.graphics.getHeight() - 100
    end

	if self.x < 0 + 0        -- fixade boundaries, hade delat self.height och self.width på 2 och det var problemet.
    then self.x = 0 + 700 
    elseif self.x + 0 > love.graphics.getWidth() -- boundaries höger och vänster, så playern inte kan rymma kartan
    then self.x = love.graphics.getWidth() -700
    end

	
	
    if love.keyboard.isDown("d") 
    then self.x = self.x + self.speed * dt
    end
    
    
    if love.keyboard.isDown("a")
    then self.x = self.x - self.speed * dt
    end
    

end

function love.draw()
	love.graphics.draw(background.img, background.x, background.y, 0, 1, 2, 0, 100)
	love.graphics.draw(platform.img, platform.x, platform.y, 0, 2, 1, 5)
	love.graphics.draw(self.img, self.x, self.y, self.height)

	love.graphics.draw(dementors.img, dementors.x , dementors.y, dementors.height, dementors.width)


	if(isGameOver) then 
        local font = love.graphics.newFont(40)
        love.graphics.setFont(font)
        local text = "OH NO! GAME OVER..."
        love.graphics.print(text, love.graphics.getWidth() / 2 - font:getWidth(text) / 2, love.graphics.getHeight() * (1 / 3))
        return
    end
 
    
end
 
function checkCollision(self, dementors)
    if self.x + self.width > dementors.x and self.x < dementors.x + dementors.width and self.y + self.height > dementors.y and self.y < dementors.y + dementors.height then
        return true
    else
        return false
    end


end