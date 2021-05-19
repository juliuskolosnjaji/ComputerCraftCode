local turtlex, turtley, turtlez = gps.locate()
print(turtlex, turtley, turtlez)

Targetx = io.read()
Targety = io.read()
Targetz = io.read()

function moveto()
    local abstandz = turtlez-Targetz
    turtle.forward()
    print(abstandz)
    local currentx, currenty, currentz = gps.locate()
    abstandz = currentz - Targetz
    
    if currentz == abstandz then
        turtle.turnRight()
        moveto()
    if currentz > abstandz then
        turtle.turnRight()
        turtle.turnRight()
    end
    if currentz < abstandz then
        for i = 1, abstandz 
        do
            turtle.forward()
            if turtle.detect() == true then
                turtle.dig()
            end
        end
    end
end
end
moveto()