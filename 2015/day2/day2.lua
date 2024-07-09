local function solution(filename)
    local wrapping_total, ribbon_total = 0, 0
    for line in io.lines(filename) do
        local dim = {} -- (l, w, h)
        for num in string.gmatch(line, "%d%d?") do
            dim[#dim + 1] = num
        end
        local side1 = dim[1] * 2 + dim[2] * 2
        local side2 = dim[1] * 2 + dim[3] * 2
        local side3 = dim[2] * 2 + dim[3] * 2
        local perimeter = math.min(side1, side2, side3)
        ribbon_total = ribbon_total + dim[1] * dim[2] * dim[3] + perimeter
        side1 = dim[1] * dim[2]
        side2 = dim[1] * dim[3]
        side3 = dim[2] * dim[3]
        local slack = math.min(side1, side2, side3)
        wrapping_total = wrapping_total + (2 * dim[1] * dim[2]) + (2 * dim[2] * dim[3]) + (2 * dim[3] * dim[1]) + slack
    end
    return wrapping_total, ribbon_total
end

print(solution("day2.txt"))
