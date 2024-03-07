function fill_map(map, filename)
	local count = 1
	local directions
	for line in io.lines(filename) do
		if count == 1 then
			directions = line
		elseif count > 2 then
			local key = string.sub(line, 1, 3)
			local value = {left = nil, right = nil}
			value.left = string.sub(line, 8, 10)
			value.right = string.sub(line, 13,15)
			map[key] = value
		end
		count = count + 1
	end
	return directions
end

function part1(map, directions)
	local cur_key = "AAA"
	local step_count = 0
	local index = 1
	local size = #directions
	while true do
		if string.sub(directions, index, index) == "R" then
			cur_key = map[cur_key].right
		elseif string.sub(directions, index, index) == "L" then
			cur_key = map[cur_key].left
		end
		step_count = step_count + 1
		index = index + 1
		if index > size then
			index = 1
		end
		if cur_key == "ZZZ" then
			break
		end
	end
	return step_count
end

local filename = "text/day8.txt"
local map = {}
local directions = fill_map(map, filename)
print(part1(map, directions))
