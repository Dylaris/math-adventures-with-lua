local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local square_count = 60
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
        0, 0,
        side_len, side_len)

    love.graphics.pop()
end

function love.draw()
    local side_len = 5
    local angle = 0
    for i = 1, square_count do
        draw_rotate_square(center_x, center_y,
            side_len, math.rad(angle), {1, 1, 1})
        side_len = side_len + 3
        angle = angle + 5
    end
end
