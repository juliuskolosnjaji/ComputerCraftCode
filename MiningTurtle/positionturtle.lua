xTarget = io.read()
yTarget = io.read()
zTarget = io.read()
--west = orientation[1]
--north = orientation[2]
--east = orientation[3]
--south = orientation[4]

xCoord, yCoord, zCoord = gps.locate()

function getOrientation()
    loc1 = vector.new(gps.locate(2, false))
    if not turtle.forward() then
        for j=1,6 do
                if not turtle.forward() then
                        turtle.dig()
             else break end
        end
    end
    loc2 = vector.new(gps.locate(2, false))
    heading = loc2 - loc1
    print ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
    orientation = ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end

function lookwest()
    while orientation ~= 1 
    do
        turtle.turnLeft()
    end
end

function lookeast()
    while orientation ~= 3
    do
        turtle.turnLeft()
    end
end

function looknorth()
    while orientation ~= 2
    do
        turtle.turnLeft()
    end
end

function looksouth()
    while orientation ~= 4
    do
        turtle.turnLeft()
    end
end

function goto(xTarget, yTarget, zTarget)
    while yTarget < yCoord
    do
        turtle.down()
    end
    while yTarget > yCoord
    do
        turtle.up()
    end
    if xTarget < xCoord then
        lookwest()
        while xTarget < xCoord
        do
            turtle.forward()
        end
    end
    if xTarget > xCoord then
        lookeast()
        while xTarget > xCoord 
        do
            turtle.forward()
        end
    end
    if zTarget < zCoord then
        looknorth()
        while zTarget < xCoord
        do
            turtle.forward()
        end
    end
    if zTarget > zCoord then
        looksouth()
        while zTarget > zCoord
        do
            turtle.forward()
        end
    end
end

--[[orientation will be:
-x = 1
-z = 2
+x = 3
+z = 4
This matches exactly with orientation in game, except that Minecraft uses 0 for +z instead of 4.
--]]
goto(xTarget, yTarget, zTarget)
getOrientation()