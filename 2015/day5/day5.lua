local function part1(filename)
	local nice = 0
	for line in io.lines(filename) do
		local vowels = 0
		local double_row = false
		local previous, current = nil, nil
		for c in string.gmatch(line, ".") do
			if c == "a" or c == "e" or c == "i" or c == "o" or c == "u" then
				vowels = vowels + 1
			end
			if not previous then
				previous = c
				current = c
			else
				current = c
				if previous == current then
					double_row = true
				end
				previous = current
			end
		end
		local ab = string.find(line, "ab")
		local cd = string.find(line, "cd")
		local pq = string.find(line, "pq")
		local xy = string.find(line, "xy")
		if vowels >= 3 and double_row and not ab and not cd and not pq and not xy then
			nice = nice + 1
		end
	end
	return nice
end

print(part1("day5.txt"))
