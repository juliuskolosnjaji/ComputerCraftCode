turtle.refuel()
print("Refueld")
local Blocks = io.read()
for local i = 1, Blocks
do
    turtle.forward()
    turtle.dig()
    turtle.forward()
end
