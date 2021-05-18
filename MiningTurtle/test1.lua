turtle.refuel()

function dig()
    for i = 1, 10
    do
        turtle.dig()
        turtle.forward()
    end
end

function turnleft()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
end

dig()
turnleft()
dig()