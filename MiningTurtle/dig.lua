turtle.refuel()

io.write("Specify Side a: ")
local a = io.read()
a = tonumber(a)
a = a-1
io.write("Specify Side b: ")
local b = io.read()
b = tonumber(b)

local ende=0

local Areal = a * b
io.write("Areal to dig ", Areal, "Blocks.")
io.write("Digging...")



for i = 1, b
do
    for i = 1, a
    do  
        if turtle.detect() == true
        then
            turtle.forward()
        end
        turtle.dig()
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()

    for i = 2, a
    do
        turtle.dig()
        turtle.forward()
    end

    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
end