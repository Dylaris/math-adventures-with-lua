local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local side_len = 1/3 * screen_width
local center_x = screen_width / 2
local center_y = screen_height / 2
local distance = (1/2*side_len)/math.cos(math.rad(30))
local vertices = {
    center_x, center_y - distance,
    center_x - 1/2*side_len, center_y + 1/2*distance,
    center_x + 1/2*side_len, center_y + 1/2*distance
}

function love.draw()
    love.graphics.setColor({1, 1, 1})
    love.graphics.polygon("line", vertices)
end
