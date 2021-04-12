dementors = {}


function dementors:load()
    self.x  = love.math.random(400)
    self.y = 0
    self.width = 20
    self.height = 10
    self.speed = 200
end
 
function dementors:update(dt)
    self.y = self.y + (self.speed * dt)
end

 
function dementors:collide()
    if checkCollision(self, player) then
        self.speed = 0
    end
end
 
function dementors:draw()
    love.graphics.draw(dementors.image, self.x , self.y, self.height)
end