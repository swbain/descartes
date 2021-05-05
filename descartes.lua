
g = grid.connect()

local active_button = {1, 1}

local width = 4
local height = 4

function init() 
    redraw()
    grid_redraw()
      
      crow.input[1].change = x_change
      crow.input[1].mode("change", 2.0, 0.25, "both")
      crow.input[2].change = y_change
      crow.input[2].mode("change", 2.0, 0.25, "both")
end

function redraw()
    screen.move(64, 32)
    screen.text_center("hello world")
    screen.update()
end

function grid_redraw() 
    for y = 1, height do
        for x = 1, width do
            if x == active_button[1] and y == active_button[2] then
                g:led(x, y, 13)
            else
                g:led(x, y, 3)
            end
        end
    end
    g:refresh()
end

function x_change(v)
    if v == 1 then
        active_button[1] = active_button[1] % width + 1
        grid_redraw()
    end
end

function y_change(v)
    if v == 1 then
        active_button[2] = active_button[2] % width + 1
        grid_redraw()
    end
end