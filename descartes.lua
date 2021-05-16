
g = grid.connect()

local active_button = {1, 1}

local width = 4
local height = 4

local active_step = 1
local x_step = 1
local y_step = 1

local active_x = 1
local active_y = 1

function init()
    init_params()
    redraw()
    grid_redraw()
    clock.run(tick)
end

function init_params()
    params:add_number("x_div", "x div", 1, 32, 1)
    params:add_number("y_div", "y div", 1, 32, 4)
end

function enc(n, d)
    if n == 2 then
        params:delta("x_div", d)
    elseif n == 3 then
        params:delta("y_div", d)
    end
    redraw()
end

function redraw()
    screen.clear()
    screen.move(64, 32)
    screen.text_center("x div = " .. params:get("x_div"))
    screen.move(64, 44)
    screen.text_center("y div = "  .. params:get("y_div"))
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
    if params:get("x_div") == 1 then
        active_x = active_x % 4 + 1
    else
        x_step = x_step % params:get("x_div") + 1
        if x_step % params:get("x_div") == 1 then
            active_x = active_x % 4 + 1
        end
    end
end

function tick_y()
    if params:get("y_div") == 1 then
        active_y = active_y % 4 + 1
    else
        y_step = y_step % params:get("y_div") + 1
        if y_step % params:get("y_div") == 1 then
            active_y = active_y % 4 + 1
        end
    end
end