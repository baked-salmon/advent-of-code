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

print(part1(lines))
io.close()