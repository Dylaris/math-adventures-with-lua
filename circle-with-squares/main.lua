local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local square_side_len = screen_width / 2
local square_count = 30
local center_x = screen_width / 2
local center_y = screen_height / 2

local function draw_rotate_square(origin_x, origin_y, side_len, rotate_angle, rect_color)
    love.graphics.push()

    love.graphics.translate(origin_x, origin_y)
    love.graphics.rotate(rotate_angle)

    love.graphics.setColor(rect_color)
    -- draw square
    love.graphics.rectangle(
        "line",
        -side_len/2, -side_len/2,
        side_len, side_len)
    -- draw diagonal line
    love.graphics.line(
        -side_len/2, -side_len/2,
        side_len/2, side_len/2,
        side_len/2, -side_len/2,
        -side_len/2, side_len/2)

    love.graphics.pop()
end

function love.draw()
    for i = 1, square_count do
        local angle = math.rad(i / square_count * 360)
        draw_rotate_square(center_x, center_y, square_side_len, angle, {1, 1, 1})
    end
end
