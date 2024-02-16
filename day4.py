import re

def parse_file(filename: str) -> list[int]:
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

def part1(cards: list[int]) -> int:
	total = 0
	for card in cards:
		power = -1
		for num in card[0]:
			if num in card[1]:
				power += 1
		if power > -1:
			total += 2**power
	return total

cards = parse_file("text/day4.txt")
print(part1(cards))