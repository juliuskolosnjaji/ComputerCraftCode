local SlotCount = 16
local direction = "north"


io.write("Width: ")
local w = io.read()
w = tonumber(w)
io.write("Depth: ")
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
    "minecraft:raw_gold",
    "minecraft:raw_iron",
    "minecarft:redstone",
    "minecarft:coal",
    "minecraft:diamond",
    "modern_industrialization:raw_lead",
    "modern_industrialization:raw_silver",
    "modern_industrialization:raw_tin",
    "modern_industrialization:raw_titanium",
    "modern_industrialization:raw_tungsten",
    "modern_industrialization:raw_nickel",
    "modern_industrialization:raw_antimony"
}

FUEL_ITEMS = {
    "minecraft:coal",
    "minecraft:coal_block",
    "minecraft:charcoal",
    "modern_industrialization:lignite_coal",
    "modern_industrialization:lignite_coal_block",
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
    turtle.digDown()
    turtle.down()
end

function turnAround(tier)
    if(tier % 2 == 1) then
        if(direction == "north" or direction == "east") then
            rightTurn()
        elseif(direction == "south" or direction == "west") then
            leftTurn()
        end
    else
        if(direction == "north" or direction == "east") then
            leftTurn()
        elseif(direction == "south" or direction == "west") then
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

function dropItemsFromList()
    print("Purging Inventory...")
 
    for slot = 1, SlotCount, 1 do
        local item = turtle.getItemDetail(slot)
        local keepItem = false
        if(item ~= nil) then
            for keepItemIndex = 1, #WANTED_ITEMS, 1 do
                if(item["name"] == WANTED_ITEMS[keepItemIndex]) then
                    keepItem = true
                end
 
                print(item["name"])
                print(WANTED_ITEMS[keepItemIndex])
                print(item["name"] == WANTED_ITEMS[keepItemIndex])
 
                if(not keepItem) then
                    turtle.select(slot)
                    turtle.dropDown()
                end
            end
        end
    end 
end

function manageInventory()
    refuel()
    dropItemsFromList()
    for slot = 1, SlotCount, 1 do
        local item = turtle.getItemDetail(slot)
        if(item ~= nil) then
            for filterIndex = 1, #FUEL_ITEMS, 1 do
                if(item["name"] ~= FUEL_ITEMS[filterIndex])then
                    turtle.select(slot)
                    turtle.dropUp()
                end
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
