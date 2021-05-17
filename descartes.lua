
g = grid.connect()

local width = 4
local height = 4

local Section = include("lib/section")

local sections = {
    Section:new(),
    Section:new { x_offset = 6, x_div = 4, y_div = 1 },
    Section:new { x_offset = 12, x_div = 1, y_div = 1 },
}


function init()
    redraw()
    grid_redraw()
    clock.run(tick)
end

function redraw()
    screen.clear()
    screen.move(64, 32)
    screen.text_center("x div = " .. sections[1].x_div)
    screen.move(64, 44)
    screen.text_center("y div = "  .. sections[1].y_div)
    screen.update()
end

function grid_redraw() 
    for i = 1, #sections do
        draw_section_grid(sections[i])
    end
    
    g:refresh()
end

function draw_section_grid(section)
    for y = 1, height do
        for x = 1 + section.x_offset, width + section.x_offset do
            if x == section.active_x + section.x_offset and y == section.active_y then
                g:led(x, y, 13)
            else
                g:led(x, y, 3)
            end
        end
    end
end

function tick()
    while true do
        clock.sync(1)
        for i = 1, #sections do
            sections[i]:tick()
        end
        grid_redraw()
    end
end
