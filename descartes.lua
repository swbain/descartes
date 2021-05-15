
g = grid.connect()

local active_button = {1, 1}

local width = 4
local height = 4

local active_step = 1
local x_step = 1
local y_step = 1

local active_x = 1
local active_y = 1

local x_div = 1
local y_div = 4

function init() 
    redraw()
    grid_redraw()

    clock.run(tick)
end

function redraw()
    screen.move(64, 32)
    screen.text_center("hello world")
    screen.update()
end

function grid_redraw() 
    for y = 1, height do
        for x = 1, width do
            if x == active_x and y == active_y then
                g:led(x, y, 13)
            else
                g:led(x, y, 3)
            end
        end
    end
    g:refresh()
end

function tick()
    while true do
        clock.sync(1)
        tick_x()
        tick_y()
        grid_redraw()
    end
end

function tick_x()
    if x_div == 1 then
        active_x = active_x % 4 + 1
    end
end

function tick_y()
    y_step = y_step % y_div + 1
    if y_step % y_div == 1 then
        active_y = active_y % 4 + 1
    end
end