local lines = {}
local filename = "text/day1.txt"

for line in io.lines(filename) do
	table.insert(lines, line)
end

function part1(lines)
	local total = 0
	for _, line in ipairs(lines) do
		local first
		local last
		for j in string.gmatch(line, ".") do
			local temp = tonumber(j)
			if temp then
				if not first then
					first = temp
					last = temp
				else
					last = temp
				end
			end
		end
		local str = tostring(first) .. tostring(last)
		total = total + tonumber(str)
	end
	return total
end


function index_sort(num1, num2)
	return num1.start < num2.start
end

function part2(lines)
	local total = 0
	local str_num = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}
	for _, line in ipairs(lines) do
		local number_list = {}
		-- number parsing
		do
			local flag = true
			local count = 0
			local line_size = #line
			while flag do
				count = count + 1
				if count <= line_size then
					local index = string.find(line, "%d", count)
					if index then
						local number_data = {value = 0, start = nil}
						number_data.value = tonumber(string.sub(line, index, index))
						number_data.start = index
						table.insert(number_list, number_data)
						count = index
					else
						flag = false
					end
				else
					flag = false
				end
			end
		end
		-- word parsing
		do
			for i, pattern in ipairs(str_num) do
				local count = 0
				while true do
					count = count + 1
					local index1, index2 = string.find(line, pattern, count)
					if index1 and index2 then
						local number_data = {value = 0, start = nil}
						number_data.value = i
						number_data.start = index1
						table.insert(number_list, number_data)
						count = index2
					else
						break
					end
				end
			end
		end

		table.sort(number_list, index_sort)
		local first_num = tostring(number_list[1].value)
		local last_num = tostring(number_list[#number_list].value)
		local added_sum = first_num .. last_num
		local real_num = tonumber(added_sum)
		total = total + real_num
	end
	return total
end

print(part1(lines))
print(part2(lines))