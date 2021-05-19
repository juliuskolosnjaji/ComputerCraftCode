local turtlex, turtley, turtlez = gps.locate()
print(turtlex, turtley, turtlez)
getdirection()

function getdirection()
    turtle.forward()
    local currentx, currenty, currentz = gps.locate()
    print(currentx, currenty, currentz)

    local facingeast = false  
    local facingwest = false 
    local facingsouth = false
    local facingnorth = false

    if currentx < turtlex then
        facingwest = true        
    elseif currentx > turtlex then
        facingeast = true  
    end

   
    if currentz < turtlez then
        facingnorth = true
    elseif currentz > turtlez then
        facingsouth = true
    end

   
    print("Facing east: ",facingeast)
    print("Facing west: ", facingwest)
    print("Facing north: ", facingnorth)
    print("Facing south: ", facingsouth)
end