local SlotCount = 16
local direction = "north"


io.write("Width: ")
local w = io.read()
w = tonumber(w)
io.write("depth ")
local d = io.read()
d = tonumber(d)
io.write("Height: ")
local h = io.read()
h = tonumber(h)

turtle.refuel()
FuelLevel = turtle.getFuelLevel()

if FuelLevel <= 100 then
    print("Please Refuel")
end

WANTED_ITEMS = {
    "minecraft:gold_ore",
    "minecraft:deepslate_gold_ore",
    "minecarft:redstone_ore",
    "minecarft:deepslate_redstone_ore",
    "minecraft:iron_ore",
    "minecraft:deepslate_iron_ore",
    "minecraft:diamond_ore",
    "minecraft:deepslate_diamon_ore",
    "minecraft:coal_ore",
    "minecraft:deepslate_coal_ore"
}


function refuel()
    
    turtle.select(1)

    if(turtle.getFuelLevel()<=50) then
        print("Refueling ...")

        for slot = 1, SlotCount, 1 do
            turtle.select(slot)
            if(turtle.refuel(1)) then
                return true
            end 
        end

        return false
    else
        return true
    end
end



function detectdig()
    while (turtle.detect()) do
        turtle.dig()
        turtle.digUp()
        turtle.digDown()
    end
end

function forward()
    detectdig()
    turtle.forward()
end
 
function leftTurn()
    turtle.turnLeft()
    detectdig()
    turtle.forward()
    turtle.turnLeft()
    detectdig()
end
  
function rightTurn()
    turtle.turnRight()
    detectdig()
    turtle.forward()
    turtle.turnRight()
    detectdig()
end

function changeDirection()
    if(direction == "north") then
        direction = "south"
    elseif(direction == "south") then
        direction = "north"
    elseif(direction == "west") then
        direction = "east"
    elseif(direction == "east") then
        direction = "west"
    end
 
end

function riseTier()
    turtle.turnRight()
    turtle.turnRight()
    changeDirection()
    turtle.digUp()
    turtle.down()
end

function turnAround(tier)
    if(tier % 2 == 1) then
        if(d == "north" or d == "east") then
            rightTurn()
        elseif(d == "south" or d == "west") then
            leftTurn()
        end
    else
        if(d == "north" or d == "east") then
            leftTurn()
        elseif(d == "south" or d == "west") then
            rightTurn()
        end
    end
    changeDirection()
end


function dropItems()
    print("Purging Inventory...")
    for slot = 1, SlotCount, 1 do
        local item = turtle.getItemDetail(slot)
        if(item ~= nil) then
            for filterIndex = 1, #WANTED_ITEMS, 1 do
                if not (item["name"] == WANTED_ITEMS[filterIndex]) then
                    print("Dropping unwanted Items ...")
                    turtle.select(slot)
                    turtle.dropDown()
                end
            end
        end
    end
end

function manageInventory()

    dropItems()
    for slot = 1, SlotCount, 1 do
        local item = turtle.getItemDetail(slot)
        if(item ~= nil) then
            if(item["name"] ~= "minecraft:coal_block" and item["name"] ~= "minecraft:coal") then
                turtle.select(slot)
                turtle.dropUp()
            end
        end
    end


end

function startDiggin()

    for tier = 1, h, 1 do
        for col = 1, w, 1 do
            for row = 1, d - 1, 1 do
                if(not refuel()) then
                    print("No fuel. Stopping ...")
                    return
                end
                forward()
                print(string.format("Row: %d   Col: %d", row, col))
            end
            if(col ~= w) then
                turnAround(tier)
            end
            manageInventory()
        end
        riseTier()
    end
end

startDiggin()
