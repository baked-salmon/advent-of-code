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
			your_nums = []
			your_num_str = line[pipe_index + 2:]
			matches = pattern.finditer(your_num_str)
			for match in matches:
				num = your_num_str[match.start(): match.end()]
				num = int(num)
				your_nums.append(num)
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
	size = len(cards)
	copies = collections.deque()
	for index, card in enumerate(cards):
		next_index = 0
		for num in card[0]:
			if num in card[1]:
				total += 1
				next_index += 1
				if next_index + index <= size:
					copies.append(next_index + index)				
	while len(copies) > 0:
		next_index = 0
		copies_index = copies.pop()
		cur = cards[copies_index]
		for num in cur[0]:
			if num in cur[1]:
				total += 1
				next_index += 1
				if next_index + copies_index <= size:
					copies.append(copies_index + next_index)
	return total + size

cards = parse_file("text/day4.txt")
print(part1(cards))
print(part2(cards))