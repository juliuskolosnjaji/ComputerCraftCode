turtle.refuel()

io.write("Specify Side a: ")
local a = io.read()
a = tonumber(a)
io.write("Specify Side b: ")
local b = io.read()
b = tonumber(b)
io.write("Specify Side c: ")
local c = io.read()
c = tonumber(c)

local ende=0

local Areal = a * b
io.write("Areal to dig ", Areal, "Blocks.")
io.write("Digging...")

local turn = 0

for g = 1, c, 1 do
    for j=1,b,1 do    

        if turn == 1 then
            -- links 2xdrehen
            turtle.turnLeft()
            if turtle.detect()  == true then 
                turtle.dig()    
                turtle.forward()
            else
                turtle.forward()
            end
            turtle.turnLeft()
            turn = 2
        elseif turn == 2 then
            -- rechts 2xdrehen
            turtle.turnRight()
            if turtle.detect()  == true then 
                turtle.dig()    
                turtle.forward()
            else
                turtle.forward()
            end
            
            turtle.turnRight()
            turn = 1
        end
        
        for i=2,a,1 do
            if turtle.detect()  == true then 
                turtle.dig() 
                turtle.forward()
            else
                turtle.forward()
            end 
        end

        if turn == 0 then turn =1 end
    end
    turtle.turnLeft()
    while turtle.detect() == false 
    do
        turtle.forward()
    end
    if turtle.detect() == true then
        turtle.turnLeft()
    end
    while turtle.detect() == true 
    do
        turtle.forward()
    end
    if turtle.detect() == true then
        turtle.turnLeft()
    end
    turtle.digDown()
    turtle.down()
    turn = 0
end