local turtlex, turtley, turtlez = gps.locate()
print(turtlex, turtley, turtlez)

Targetx = io.read()
Targety = io.read()
Targetz = io.read()

function movetoz()
    local abstandz = turtlez-Targetz
    turtle.forward()
    print(abstandz)
    local currentx, currenty, currentz = gps.locate()
    local abstandz_current = currentz - Targetz
    if abstandz < abstandz_current then
        turtle.turnRight()
        turtle.turnRight()
    end
    if abstandz == abstandz_current then
        turtle.turnRight()
        moveto()
    end
    if abstandz_current < 0 then
        abstandz_current = math.abs(abstandz_current)
        turtle.turnLeft()
        turtle.turnLeft()
    end
    if abstandz > abstandz_current then
        for i = 1, abstandz 
        do
            turtle.forward()
            if turtle.detect() == true then
                turtle.dig()
            end
        end
    end
end

function movetox()
    local abstandx = turtlex-Targetx
    turtle.forward()
    print(abstandx)
    local currentx, currenty, currentz = gps.locate()
    local abstandx_current = currentx - Targetx
    if abstandx < abstandx_current then
        turtle.turnRight()
        turtle.turnRight()
    end
    if abstandx == abstandx_current then
        turtle.turnRight()
        moveto()
    end
    if abstandx_current < 0 then
        abstandx_current = math.abs(abstandx_current)
        turtle.turnLeft()
        turtle.turnLeft()
    end
    if abstandx > abstandx_current then
        for i = 1, abstandx 
        do
            turtle.forward()
            if turtle.detect() == true then
                turtle.dig()
            end
        end
    end
end
movetoz()
movetox()