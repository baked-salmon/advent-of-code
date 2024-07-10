local function update_coords(data, condition, coord1, coord2)
    local _, last = string.find(data, condition)
    coord1.x, coord1.y, coord2.x, coord2.y = string.match(string.sub(data, last + 2), "(%d+),(%d+)%sthrough%s(%d+),(%d+)")
end

local function make_matrix()
    local matrix = {}
    for row = 1, 999 do
        matrix[row] = {}
        for col = 1, 999 do
            matrix[row][col] = 0
        end
    end
    return matrix
end

local function update_matrix(matrix, coord1, coord2, func)
    for row = coord1.x, coord2.x do
        for col = coord1.y, coord2.y do
            matrix[row][col] = func(matrix[row][col])
        end
    end
end

local function part1(filename)
    local matrix = make_matrix()
    local status = {TURN_ON = "turn on", TOGGLE = "toggle", TURN_OFF = "turn off"}
    for line in io.lines(filename) do
        local cur_status = nil
        local start_pos, finish_pos = {}, {}
        if string.match(line, status.TURN_ON) then
            cur_status = status.TURN_ON
        elseif string.match(line, status.TURN_OFF) then
            cur_status = status.TURN_OFF
        elseif string.match(line, status.TOGGLE) then
            cur_status = status.TOGGLE
        end
        update_coords(line, cur_status, start_pos, finish_pos)
        if cur_status == status.TURN_ON then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                return 1
            end)
        elseif cur_status == status.TURN_OFF then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                return 0
            end)
        elseif cur_status == status.TOGGLE then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                if entry == 1 then
                    entry = 0
                else
                    entry = 1
                end
                return entry
            end)
        end
    end
    local lights = 0
    for row = 1, 999 do
        for col = 1, 999 do
            if matrix[row][col] == 1 then
                lights = lights + 1
            end
        end
    end
    return lights
end

local function part2(filename)
    local matrix = make_matrix()
    local status = {TURN_ON = "turn on", TOGGLE = "toggle", TURN_OFF = "turn off"}
    for line in io.lines(filename) do
        local cur_status = nil
        local start_pos, finish_pos = {}, {}
        if string.match(line, status.TURN_ON) then
            cur_status = status.TURN_ON
        elseif string.match(line, status.TURN_OFF) then
            cur_status = status.TURN_OFF
        elseif string.match(line, status.TOGGLE) then
            cur_status = status.TOGGLE
        end
        update_coords(line, cur_status, start_pos, finish_pos)
        if cur_status == status.TURN_ON then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                return entry + 1
            end)
        elseif cur_status == status.TURN_OFF then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                entry = entry - 1
                if entry < 0 then
                    entry = 0
                end
                return entry
            end)
        elseif cur_status == status.TOGGLE then
            update_matrix(matrix, start_pos, finish_pos, function (entry)
                return entry + 2
            end)
        end
    end
    local lights = 0
    for row = 1, 999 do
        for col = 1, 999 do
            lights = lights + matrix[row][col]
        end
    end
    return lights
end

local filename = "day6.txt"
print(part1(filename))
print(part2(filename))
