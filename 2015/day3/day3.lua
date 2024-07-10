local function update_coord(dir, coord)
	if dir == ">" then
		coord.x = coord.x + 1
	elseif dir == "<" then
		coord.x = coord.x - 1
	elseif dir == "^" then
		coord.y = coord.y + 1
	elseif dir == "v" then
		coord.y = coord.y - 1
	end
end

local function part1(content)
	local dict = {["00"] = true}
	local pos = {x = 0, y = 0}
	for c in string.gmatch(content, ".") do
		update_coord(c, pos)
		local entry = tostring(pos.x) .. tostring(pos.y)
		if not dict[entry] then
			dict[entry] = true
		end
	end
	local houses = 0
	for _, _ in pairs(dict) do
		houses = houses + 1
	end
	return houses
end

local function part2(content)
	local turn = 0
	local santa_pos = {x = 0, y = 0}
	local robo_pos = {x = 0, y = 0}
	local dict = {["00"] = true}
	for c in string.gmatch(content, ".") do
		local cur_turn = nil
		if turn % 2 == 0 then
			cur_turn = santa_pos
		else
			cur_turn = robo_pos
		end
		update_coord(c, cur_turn)
		local entry = tostring(cur_turn.x) .. tostring(cur_turn.y)
		if not dict[entry] then
			dict[entry] = true
		end
		turn = turn + 1
	end
	local houses = 0
	for _, _ in pairs(dict) do
		houses = houses + 1
	end
	return houses
end

local fileentry = "day3.txt"
local file = io.open(fileentry)
local content = file:read("*all")
file:close()
print(part1(content))
print(part2(content))
