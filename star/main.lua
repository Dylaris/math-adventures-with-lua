local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local side_len = 1/3 * screen_width
local center_x = screen_width / 2
local center_y = screen_height / 2
local distance = (1/2*side_len)/math.sin(math.rad(360/5))
-- clockwise
local vertices = {
    {center_x, center_y - distance}, -- a
    {center_x + 1/2*side_len, center_y - math.cos(math.rad(360/5))*distance}, -- b
    {center_x + math.sin(math.rad(360/10))*distance, center_y + math.cos(math.rad(360/10))*distance}, -- c
    {center_x - math.sin(math.rad(360/10))*distance, center_y + math.cos(math.rad(360/10))*distance}, -- d
    {center_x - 1/2*side_len, center_y - math.cos(math.rad(360/5))*distance} -- e
}
local A = 1
local B = 2
local C = 3
local D = 4
local E = 5

function love.draw()
    love.graphics.setColor({1, 1, 1})
    -- eb
    love.graphics.line(vertices[E][1], vertices[E][2], vertices[B][1], vertices[B][2])
    -- bd
    love.graphics.line(vertices[B][1], vertices[B][2], vertices[D][1], vertices[D][2])
    -- da
    love.graphics.line(vertices[D][1], vertices[D][2], vertices[A][1], vertices[A][2])
    -- ac
    love.graphics.line(vertices[A][1], vertices[A][2], vertices[C][1], vertices[C][2])
    -- ce
    love.graphics.line(vertices[C][1], vertices[C][2], vertices[E][1], vertices[E][2])
end
