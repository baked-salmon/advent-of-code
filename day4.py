import re
import collections

def parse_file(filename: str) -> list:
	cards = []
	pattern = re.compile(r"\d\d?")
	pipe_index = 40
	colon_index = 8
	with open(filename) as file:
		for line in file:
			card = []
			winning_nums = []
			win_num_str = line[colon_index + 1: pipe_index - 1]
			matches = pattern.finditer(win_num_str)
			for match in matches:
				num = win_num_str[match.start(): match.end()]
				num = int(num)
				winning_nums.append(num)
			card.append(winning_nums)
			your_nums = set()
			your_num_str = line[pipe_index + 2:]
			matches = pattern.finditer(your_num_str)
			for match in matches:
				num = your_num_str[match.start(): match.end()]
				num = int(num)
				your_nums.add(num)
			card.append(your_nums)
			cards.append(card)
	return cards

def part1(cards: list) -> int:
	total = 0
	for card in cards:
		power = -1
		for num in card[0]:
			if num in card[1]:
				power += 1
		if power > -1:
			total += 2**power
	return total

def part2(cards: list) -> int:
	total = 0 
	copies = collections.deque()
	cache = {}
	for index, card in enumerate(cards):
		win_nums = []
		next_index = 0
		for num in card[0]:
			if num in card[1]:
				total += 1
				next_index += 1
				win_nums.append(next_index + index)
				copies.append(next_index + index)
		if len(win_nums) > 0:		
			cache[index] = win_nums		
	while len(copies) > 0:
		next_index = 0
		copies_index = copies.pop()
		if copies_index in cache:
			copies.extend(cache[copies_index])
			total += len(cache[copies_index])
	return total + len(cards)

cards = parse_file("text/day4.txt")
print(part1(cards))
print(part2(cards))