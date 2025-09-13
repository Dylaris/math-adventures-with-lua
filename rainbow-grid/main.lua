local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local cell_num = 20
local cell_width = math.floor(screen_width / cell_num)
local cell_height = math.floor(screen_height / cell_num)
local cell_gap_radio = 7/10

local function hsv_to_rgb(h, s, v)
    if s <= 0 then return v,v,v end
    h = h*6
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0, 0, 0
    if h < 1 then
        r, g, b = c, x, 0
    elseif h < 2 then
        r, g, b = x, c, 0
    elseif h < 3 then
        r, g, b = 0, c, x
    elseif h < 4 then
        r, g, b = 0, x, c
    elseif h < 5 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    return r+m, g+m, b+m
end

local function draw_grid1()
    local mouse_x, mouse_y = love.mouse.getPosition()

    for x = 0, cell_num-1 do
        for y = 0, cell_num-1 do
            local rect_center_x = x*cell_width + 1/2*cell_gap_radio*cell_width
            local rect_center_y = y*cell_height + 1/2*cell_gap_radio*cell_height

            local dx = rect_center_x - mouse_x
            local dy = rect_center_y - mouse_y
            local angle = math.atan2(dy, dx) -- [-π, π]

            local hue = (angle + math.pi) / (2 * math.pi) -- [0, 1]

            local distance = math.sqrt(dx*dx + dy*dy)
            local max_distance = math.sqrt(screen_width^2 + screen_height^2)
            local distance_factor = 1 - math.min(distance / max_distance, 1)

            local final_hue = (hue + distance_factor * 0.8) % 1.0

            local r, g, b = hsv_to_rgb(final_hue, 1, 1)
            love.graphics.setColor(r, g, b)
            love.graphics.rectangle(
                "fill",
                x*cell_width, y*cell_height,
                cell_gap_radio*cell_width, cell_gap_radio*cell_height)
        end
    end
end

local function draw_grid2()
    local mouse_x, mouse_y = love.mouse.getPosition()

    for x = 0, cell_num-1 do
        for y = 0, cell_num-1 do
            local rect_center_x = x*cell_width + 1/2*cell_gap_radio*cell_width
            local rect_center_y = y*cell_height + 1/2*cell_gap_radio*cell_height
            local distance = math.sqrt((mouse_x-rect_center_x)^2 + (mouse_y-rect_center_y)^2)
            local hue = 0.8*distance/255%1
            local r, g, b = hsv_to_rgb(hue, 1, 1)
            love.graphics.setColor(r, g, b)
            love.graphics.rectangle(
                "fill",
                x*cell_width, y*cell_height,
                cell_gap_radio*cell_width, cell_gap_radio*cell_height)
        end
    end
end

function love.draw()
    draw_grid1()
end
