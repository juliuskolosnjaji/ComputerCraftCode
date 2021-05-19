local SLOT_COUNT = 16

turtle.refuel()
flevel = turtle.getFuelLevel()
io.write(flevel)
if flevel <= 100 then
    print("Fuel level below 100. Please refill coal.")
end
io.write("Specify Side a: ")
local a = io.read()
a = tonumber(a)
io.write("Specify Side b: ")
local b = io.read()
b = tonumber(b)
io.write("Specify Side c: ")
local c = io.read()
c = tonumber(c)

local KEEP_ITEMS = {
    minecraft:diamond_ore,
    minecraft:iron_ore,
    minecraft:coal_ore,
    minecraft:ancient_debris,
}

function dropItemsFromList()
    print("Purging Inventory...")
 
    for slot = 1, SLOT_COUNT, 1 do
        local item = turtle.getItemDetail(slot)
        local keepItem = false
        if(item ~= nil) then
            for keepItemIndex = 1, #KEEP_ITEMS, 1 do
                if(item["name"] == KEEP_ITEMS[keepItemIndex]) then
                    keepItem = true
                end
 
                print(item["name"])
                print(KEEP_ITEMS[keepItemIndex])
                print(item["name"] == KEEP_ITEMS[keepItemIndex])
 
                if(not keepItem) then
                    turtle.select(slot)
                    turtle.dropDown()
                end
            end
        end
    end 
end

local ende=0

local Area = a * b * c
print("Area to dig: ", Area, "Blocks.")
print("Digging...")

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
    dropItemsFromList()
end