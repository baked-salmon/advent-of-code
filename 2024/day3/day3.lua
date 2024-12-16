local function part1(content)
	local total = 0
	for c in content:gmatch("mul%(%d+,%d+%)") do
		local first, second = string.match(c, "mul%((%d+),(%d+)%)")
		total = total + tonumber(first) * tonumber(second)
	end
	return total
end

local function entry(a, b, c )
	return {type = a, index = b, value = c}
end

local function find_conditional(str, pattern, memory, type)
	local i, j = 0, 0
	while true do
		i, j = string.find(str, pattern, j, true)
			if i == nil or j == nil then
				break
			end
		table.insert(memory, entry(type, i, 0))
	end
end

local function part2(content)
	local type = {DO = 1, DONT = 2 , MUL = 3}
	local instructions = {}
	local i, j = 0, 0
	while true do
		i, j = string.find(content, "mul%(%d+,%d+%)", j)
		if i == nil or j == nil then
			break
		end
		local first, second = string.match(string.sub(content,i,j), "mul%((%d+),(%d+)%)")
		table.insert(instructions, entry(type.MUL, i, tonumber(first) * tonumber(second)))
	end

	find_conditional(content, "do()", instructions, type.DO)
	find_conditional(content, "don't()", instructions, type.DONT)

	table.sort(instructions, function (a, b)
		return a.index < b.index
	end)

	local active = false
	local total = 0
	for _, entry in ipairs(instructions) do
		if entry.type == type.DONT then
			active = false
		elseif entry.type == type.DO then
			active = true
		end

		if active then
			total = total + entry.value
		end
	end
	return total
end

local file = io.open("input.txt", "r")
local content = file:read("*all")
file:close()
print("Part 1: " .. part1(content))
print("Part 2: " .. part2(content))