
function init() 
    redraw()
end

function redraw()
    screen.move(64, 32)
    screen.text_center("hello world")
    screen.update()
end