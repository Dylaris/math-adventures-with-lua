local max_x, min_x = 10, -10
local max_y, min_y = 10, -10
local range_x, range_y = max_x - min_x, max_y - min_y

local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local side_x = screen_width / range_x
local side_y = screen_height / range_y

local white = {1, 1, 1}
local black = {0, 0, 0}
local red = {1, 0, 0, 0.3}
local blue = {0, 0, 1, 0.3}

local function draw_grid()
    love.graphics.setColor(blue)
    for i = 1, range_x do
        love.graphics.line(i*side_x, 0, i*side_x, screen_height)
    end
    for i = 1, range_y do
        love.graphics.line(0, i*side_y, screen_width, i*side_y)
    end
    love.graphics.setColor(black)
    love.graphics.line(screen_width/2, 0, screen_width/2, screen_height)
    love.graphics.line(0, screen_height/2, screen_width, screen_height/2)
end

local function draw_point(x, y, color)
    love.graphics.push()
    love.graphics.translate(screen_width/2, screen_height/2)

    love.graphics.setColor(color)
    love.graphics.circle("fill", x*side_x, -y*side_y, 2)

    love.graphics.pop()
end

local function draw_function(func)
    local x = min_x
    while x <= max_x do
        draw_point(x, func(x), red)
        x = x + 0.001
    end
end

function love.load()
    love.graphics.setBackgroundColor(white)
end

function love.draw()
    draw_grid()
    draw_function(function(x)
        return 6*x*x*x + 31*x*x + 3*x - 10
    end)
end
