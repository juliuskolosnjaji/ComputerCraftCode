local turtlex, turtley, turtlez = gps.locate()
print(turtlex, turtley, turtlez)

Targetx, Targety, Targetz = io.read()

function moveto()
    turtle.forward()
    local abstandz = turtlez-Targetz
    local currentx, currenty, currentz = gps.locate()
    
    if currentz == abstandz then
        turtle.turnLeft()
        moveto()
    if currentz > abstandz then
        turtle.turnLeft()
        turtle.turnLeft()
    end
    end
end

moveto()