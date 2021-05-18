turtle.refuel()

io.write("Specify Side a: ")
local a = io.read()
a = tonumber(a)
io.write("Specify Side b: ")
local b = io.read()
b = tonumber(b)

local ende=0

local Areal = a * b
io.write("Areal to dig ", Areal, "Blocks.")
io.write("Digging...")


for j=1,b,1 do
    
    for i=1,a,1 do
        if turtle.detect()  == true then 
            turtle.dig() 
        else
            turtle.forward()
        end 
    end

    local turn = true
  

    if turn == true then
        -- links 2xdrehen
        turtle.turnLeft()
        if turtle.detect()  == true then 
            turtle.dig()    
        end
        turtle.forward()
        turtle.turnLeft()
        turn = false
    else
        -- rechts 2xdrehen
        turtle.turnRight()
        if turtle.detect()  == true then 
            turtle.dig()    
        end
        turtle.forward()
        turtle.turnRight()
        turn = true
    end

end