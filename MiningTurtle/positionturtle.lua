local turtlex, turtley, turtlez = gps.locate()
print(turtlex, turtley, turtlez)

function getdirection()
    turtle.forward()
    local currentx, currenty, currentz = gps.locate()
    print(currentx, currenty, currentz)

    local facingeast = false  
    local facingwest = false 
    local facingsouth = false
    local facingnorth = false

    if currentx < turtlex then
        facingeast = true          
    elseif currentx > turtlex 
        facingwest = true
    end

   
    if currentz < turtlez then
        facingnorth = true
    elseif currentz > turtlez
        facingsouth = true
    end

   
    print("Facing east: ",facingeast)
    print("Facing west: ", facingwest)
    print("Facing north: ", facingnorth)
    print("Facing south: ", facingsouth)
end