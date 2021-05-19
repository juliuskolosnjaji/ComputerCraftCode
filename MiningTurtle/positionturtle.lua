local turtlex, turtley, turtlez = gps.locate()

function getdirection()
    turtle.forward()
    local currentx, currenty, currentz = gps.locate()
    if currentx < turtlex then
        local facingeast = true
        turtle.back()
    else
        local facingeast = false
        turtle.back()
    end

    turtle.back()
    currentx, currenty, currentz = gps.locate()
    if currentx > turtlex then
        local facingwest = true
        turtle.forward()
    else
        facingwest = false
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.forward()
    currentx, currenty, currentz = gps.locate()
    if currentz < turtlez then
        local facingnorth = true
        turtle.back()
        turtle.turnRight()
    else
        facingnorth = false
        turtle.back()
        turtle.turnRight()
    end

    turtle.turnRight()
    turtle.forward()
    currentx, currenty, currentz = gps.locate()
    if currentz > turtlez then
        local facingsouth = true
        turtle.back()
        turtle.turnLeft()
    else
        facingsouth = false
        turtle.back()
        turtle.turnLeft()
    end
    print("Facing east: ",facingeast)
    print("Facing west: ", facingwest)
    print("Facing north: ", facingnorth)
    print("Facing south: ", facingsouth)
end