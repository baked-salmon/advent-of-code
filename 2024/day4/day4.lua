local function process_horizontal(text)
	local total = 0
	for line in io.lines(text) do
		for _ in string.gmatch(line, "XMAS") do
			total = total + 1
		end
		for _ in string.gmatch(line, "SAMX") do
			total = total + 1
		end
	end
	return total
end

local function create_grid(text, size)
	local file = io.open(text, "r")
	local content = file:read("*all")
	file:close()
	local grid = {}
	local increment = 0
	local subgrid = {}
	for c in string.gmatch(content, "%a") do
		increment = increment + 1
		table.insert(subgrid, c)
		if increment == size then
			table.insert(grid, subgrid)
			subgrid = {}
			increment = 0
		end
	end
	return grid
end

local function process_vertical(grid, size)
	local total = 0
	for i = 1, size do
		local vertical_line = ""
		for j = 1, size do
			vertical_line = vertical_line .. grid[j][i]
		end
		for _ in string.gmatch(vertical_line, "XMAS") do
			total = total + 1
		end
		for _ in string.gmatch(vertical_line, "SAMX") do
			total = total + 1
		end
	end
	return total
end

local function process_diagonal(grid, size)
	local total = 0
	for i = 1, size - 3  do
		local str = ""
		for j = 1, size - 3 do
			str = str .. grid[i][j] .. grid[i + 1][j + 1] .. grid[i + 2][j + 2] .. grid[i + 3][j + 3]
			if str == "XMAS" or str == "SAMX" then
				total = total + 1
			end
			str = ""
		end
	end
	for i = 4, size do
		local str = ""
		for j = 1, size - 3 do
			str = str .. grid[i][j] .. grid[i - 1][j + 1] .. grid[i - 2][j + 2] .. grid[i - 3][j + 3]
			if str == "XMAS" or str == "SAMX" then
				total = total + 1
			end
			str = ""
		end
	end
	return total
end

local file = "input.txt"
local size = 140
local grid = create_grid(file,  size)
local total = process_horizontal(file) + process_vertical(grid, size) + process_diagonal(grid, size)
print("Part 1: " .. total)