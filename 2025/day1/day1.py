def process_input(filename):
    data = []
    with open(filename) as file:
        for line in file:
            content = line.strip()
            data.append((content[0], content[1:]))
    return data

def part1(data):
    start = 50
    count = 0
    for element in data:
        if element[0] == "L":
            start = (start + int(element[1])) % 100
        else:
            start = (start - int(element[1])) % 100
        if start == 0:
            count += 1
    return count

def part2(data):
    start = 50
    count = 0
    for element in data:
        if element[0] == "L":
            for _ in range(int(element[1])):
                start += 1
                if start == 100:
                   start = 0
                if start == 0:
                   count += 1
        else:
            for _ in range(int(element[1])):
                start -= 1
                if start == -1:
                    start = 99
                if start == 0:
                    count += 1
    return count
           
test = process_input('test.txt')
assert part1(test) == 3, 'Part1 fail.'
assert part2(test) == 6, 'Part2 fail.'
data = process_input('input.txt')
print(f"Part1: {part1(data)}\nPart2: {part2(data)}")