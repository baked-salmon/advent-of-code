local function part1(filename)
	local file = io.open(filename, "r")
	local content = file:read("*all")
	local total = 0
	for num in content:gmatch("-?%d+") do
		total = total + tonumber(num)
	end
	file:close()
	return total
end

print(part1("day12.txt"))
