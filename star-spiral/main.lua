local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local center_x = screen_width / 2
local center_y = screen_height / 2
local star_count = 60

local A = 1
local B = 2
local C = 3
local D = 4
local E = 5

local function draw_rotate_star(origin_x, origin_y, side_len, rotate_angle, color)
    love.graphics.push()

    love.graphics.translate(origin_x, origin_y)
    love.graphics.rotate(rotate_angle)

    local distance = (1/2*side_len)/math.sin(math.rad(360/5))
    -- clockwise
    local vertices = {
        {0, 0}, -- a
        {1/2*side_len, -(distance - distance*math.cos(math.rad(360/5)))}, -- b
        {side_len, 0}, -- c
        {1/2*side_len + distance*math.sin(math.rad(360/10)), distance*math.cos(math.rad(360/5)) + distance*math.cos(math.rad(360/10))}, -- d
        {1/2*side_len - distance*math.sin(math.rad(360/10)), distance*math.cos(math.rad(360/5)) + distance*math.cos(math.rad(360/10))} -- e
    }

    love.graphics.setColor(color)
    -- ac
    love.graphics.line(vertices[A][1], vertices[A][2], vertices[C][1], vertices[C][2])
    -- ce
    love.graphics.line(vertices[C][1], vertices[C][2], vertices[E][1], vertices[E][2])
    -- eb
    love.graphics.line(vertices[E][1], vertices[E][2], vertices[B][1], vertices[B][2])
    -- bd
    love.graphics.line(vertices[B][1], vertices[B][2], vertices[D][1], vertices[D][2])
    -- da
    love.graphics.line(vertices[D][1], vertices[D][2], vertices[A][1], vertices[A][2])

    love.graphics.pop()
end

function love.draw()
    local side_len = 5
    local angle = 0
    for _ = 1, star_count do
        draw_rotate_star(center_x, center_y, side_len, math.rad(angle), {1, 1, 1})
        angle = angle + 5
        side_len = side_len + 5
    end
end
