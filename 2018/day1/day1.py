def part1(arr):
    current_frequency = 0
    for i in arr:
        current_frequency += i
    return current_frequency

def parse_file(filename):
    arr = []
    with open(filename) as file:
        for line in file:
            arr.append(int(line.rstrip()))
    return arr

def part2(arr):
    current_frequency = 0
    repeat_list = {0: 1}
    while True:
        for i in arr:
            current_frequency += i
            if current_frequency in repeat_list:
                return current_frequency
            else:
                repeat_list[current_frequency] = 1

data = parse_file("input.txt")
print(f'Part 1: {part1(data)}')
print(f'Part 2: {part2(data)}')