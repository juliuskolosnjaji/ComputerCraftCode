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

function turnleft()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
end

function turnright()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
end

function digleft()
    for i = 1, a
    do
        turtle.dig()
        turtle.forward()
        isleft=true
    end
end

local isleft = false
local isright = false

for i = 1, b
do
    for i = 1, a
    do
        turtle.dig()
        turtle.forward()
        isleft=true
    end
    
    if isleft == true then
        turnleft()
        isleft=false
    end

    if isleft == false then
        for i = 1, a
        do
          turtle.dig()
          turtle.forward()
          isright = true
        end
    
        if isright == true then
            turnright()
            digleft()
        end
    end
end