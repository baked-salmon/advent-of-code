local file = io.open("day1.txt", "r")
local content = file:read("*all")

local function part1(content)
    local steps = 0
    for c in content:gmatch(".") do
        if c == "(" then
            steps = steps + 1
        else
            steps = steps - 1
        end
    end
    return steps
end

local function part2(content)
    local steps, position = 0, 0
    for c in content:gmatch(".") do
        if c == "(" then
            steps = steps + 1
        else
            steps = steps - 1
        end
        position = position + 1
        if steps == -1 then
            break
        end
    end
    return position
end

print(part1(content))
print(part2(content))
file:close()
