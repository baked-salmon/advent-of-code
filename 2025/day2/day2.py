def parse(filename):
    with open(filename) as file_obj:
        content = file_obj.read().split(',')
        data = []
        for interval in content:
            start, end = interval.split('-')
            data.append((int(start), int(end)))
        return data
    
def part1(data):
    total = 0
    for interval in data:
        for i in range(interval[0], interval[1] + 1):
            length = len(str(i))
            if length % 2 == 0:
                midpoint = length // 2
                left = str(i)[:midpoint]
                right = str(i)[midpoint:]
                if left == right:
                    total += i
    return total

def part2(data):
    total = 0
    for interval in data:
        for num in range(interval[0], interval[1] + 1):
            length = len(str(num))
            divisors = []
            for i in range(1, length):
                if length % i == 0:
                    divisors.append(i)
            for i in divisors:
                if str(num)[:i] * (length // i) == str(num):
                    total += num
                    break
    return total

test = parse('test.txt')
assert part1(test) == 1227775554, 'Part1 fail.'
assert part2(test) == 4174379265, 'Part2 fail.'

data = parse('input.txt')
print(f'Part1: {part1(data)}\nPart2: {part2(data)}')