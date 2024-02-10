local games = {}
local filename = "text/day2.txt"

function color_parser(str, set)
	local colors = { blue = "%d+ b", green = "%d+ g", red = "%d+ r" }
  for red in string.gmatch(str, colors.red) do
		local num = string.match(red, "%d+")
    if num then
      local real_num = tonumber(num)
      set.red = real_num
    end
  end
  for green in string.gmatch(str, colors.green) do
    local num = string.match(green, "%d+")
    if num then
      local real_num = tonumber(num)
      set.green = real_num
    end
  end
  for blue in string.gmatch(str, colors.blue) do
  	local num = string.match(blue, "%d+")
  	if num then
  	  local real_num = tonumber(num)
  	  set.blue = real_num
  	end
  end
end

function parse_file(filename, games)
  for line in io.lines(filename) do
    local new_set = "%d+ .+"
    local game = {}
    local substring = nil
    for str in string.gmatch(line, new_set) do
      substring = str
      local last_semicolon = 1
      local index = 1
      while index do
        local set = { red = 0, blue = 0, green = 0 }
        local temp
        index = string.find(substring, ";")
        if index then
          last_semicolon = last_semicolon + index
          temp = substring:sub(1, index)
          color_parser(temp, set)
          table.insert(game, set)
          substring = string.sub(substring, index + 1)
        else
          temp = string.sub(str, last_semicolon)
          color_parser(temp, set)
          table.insert(game, set)
        end
      end
    end
  table.insert(games, game)
  end
end

function pprint(games)
  for id, game in ipairs(games) do
    io.write("Id: " .. id .. "\n")
    for _, set in ipairs(game) do
      io.write("(" .. set.red)
      io.write(", " ..set.green)
      io.write(", " .. set.blue .. ")\n")
    end
    io.write("===============================\n")
  end
end

function find_game(games)
  local id_sum = 0
  local RED_MAX = 12
  local BLUE_MAX = 14
  local GREEN_MAX = 13
  for id, game in ipairs(games) do
    local red_bool = true
    local green_bool = true
    local blue_bool = true
    for _, set in ipairs(game) do
      if set.red > RED_MAX then
        red_bool = false
      end
      if set.green > GREEN_MAX then
        green_bool = false
      end
      if set.blue > BLUE_MAX then
        blue_bool = false
      end
    end
    if red_bool and green_bool and blue_bool then
      id_sum = id_sum + id
    end
  end
  return id_sum
end

function find_power(games)
	local sum = 0
	for id, game in ipairs(games) do
		local red_min
		local green_min
		local blue_min
		for _, set in ipairs(game) do
			if not red_min then
				red_min = set.red
			else
				if set.red > red_min then
					red_min = set.red
				end
			end
			if not green_min then
				green_min = set.green
			else
				if set.green > green_min then
					green_min = set.green
				end
			end
			if not blue_min then
				blue_min = set.blue
			else
				if set.blue > blue_min then
					blue_min = set.blue
				end
			end
		end
		local power = red_min * green_min * blue_min
		sum = sum + power
	end
	return sum
end

parse_file(filename, games)
--pprint(games)
print(find_game(games))
print(find_power(games))
