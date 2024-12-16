local function part1(content)
	local total = 0
	for c in content:gmatch("mul%(%d+,%d+%)") do
		local first, second = string.match(c, "mul%((%d+),(%d+)%)")
		total = total + tonumber(first) * tonumber(second)
		print(total)
	end
	return total
end

local file = io.open("input.txt", "r")
local content = file:read("*all")
file:close()
print(part1(content))