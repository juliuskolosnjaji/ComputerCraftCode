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
    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end
    
--[[orientation will be:
-x = 1
-z = 2
+x = 3
+z = 4
This matches exactly with orientation in game, except that Minecraft uses 0 for +z instead of 4.
--]]

print(heading)