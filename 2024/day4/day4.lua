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
	for row = 1, size do
		local vertical_line = ""
		for col = 1, size do
			vertical_line = vertical_line .. grid[col][row]
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
	for row = 1, size - 3  do
		local str = ""
		for col = 1, size - 3 do
			str = str .. grid[row][col] .. grid[row + 1][col + 1] .. grid[row + 2][col + 2] .. grid[row + 3][col + 3]
			if str == "XMAS" or str == "SAMX" then
				total = total + 1
			end
			str = ""
		end
	end
	for row = 4, size do
		local str = ""
		for col = 1, size - 3 do
			str = str .. grid[row][col] .. grid[row - 1][col + 1] .. grid[row - 2][col + 2] .. grid[row - 3][col + 3]
			if str == "XMAS" or str == "SAMX" then
				total = total + 1
			end
			str = ""
		end
	end
	return total
end

local function part2(grid, size)
	local total = 0
	for row = 3, size do
		local str1 = ""
		local str2 = ""
		for col = 1, size - 2 do
			str1 = str1 .. grid[row][col] .. grid[row - 1][col + 1] .. grid[row - 2][col + 2]
			str2 = str2 .. grid[row - 2][col] .. grid[row -1][col + 1] .. grid[row][col + 2]
			if (str1 == "MAS" or str1 == "SAM") and (str2 == "MAS" or str2 == "SAM") then
				total = total + 1
			end
			str1 = ""
			str2 = ""
		end
	end
	return total
end

local file, size  = "input.txt", 140
local grid = create_grid(file,  size)
local total = process_horizontal(file) + process_vertical(grid, size) + process_diagonal(grid, size)
print("Part 1: " .. total)
print("Part 2: " .. part2(grid, 140))