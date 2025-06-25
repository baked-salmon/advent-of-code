def parse_file(filename):
    arr = []
    with open(filename) as file:
        for line in file:
            arr.append(line.rstrip())
    return arr

def part1(arr):
    doubles = 0
    triples = 0
    size = len(arr[0])
    for line in arr:
        visited = []
        find_double = False
        find_triple = False
        for i in line:
            if not i in visited:
                count = 0
                visited.append(i)
                pos = 0
                while line.find(i,pos) != -1 and pos < size:
                    count += 1
                    pos = line.find(i,pos) + 1
                if count == 3 and not find_triple:
                    triples += 1
                    find_triple = True
                elif count == 2 and not find_double:
                    doubles += 1
                    find_double = True
    return doubles * triples

def part2(arr):
    for i in range(len(arr)):
        for j in range(len(arr)):
            diff = 0
            if arr[i] != arr[j]:
                for k in range(len(arr[i])):
                    if arr[i][k] != arr[j][k]:
                        diff += 1
                        if diff > 1:
                            break
            if diff == 1:
                common = ""
                for z in range(len(arr[i])):
                    if arr[i][z] == arr[j][z]:
                        common += arr[i][z]
                return common
    return -1

data = parse_file("input.txt")
print(f'Part 1: {part1(data)}')
print(f'Part 2: {part2(data)}')