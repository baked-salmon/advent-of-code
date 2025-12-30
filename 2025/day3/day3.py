def get_data(filename):
    with open(filename) as file_obj:
        data = []
        for line in file_obj:
            data.append(line.strip())
        return data

def part1(input):
    total = 0
    for battery in input:
        highest = 0
        for i in range(len(battery)):
           for j in battery[i+1:]:
                num = int(str(battery[i]) + str(j))
                if num > highest:
                    highest = num
        total += highest
    return total

test = get_data('test.txt')
assert part1(test) == 357, 'Part1 fail.'

data = get_data('input.txt')
print(f'Part1: {part1(data)}')
