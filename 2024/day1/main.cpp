#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cmath>

int main() 
{
	std::fstream file("input.txt");
	std::string str;
	std::vector<int> left;
	std::vector<int> right;
	while (std::getline(file, str)) 
	{
		left.push_back(std::stoi(str.substr(0, 6)));
		right.push_back(std::stoi(str.substr(8, 5)));
	}
	std::sort(left.begin(), left.end());
	std::sort(right.begin(), right.end());

	int score = 0;
	for (int i = 0; i < left.size(); i++)
	{
		score += abs(left[i] - right[i]);
	}
	std::cout << "Part 1: " << score << '\n';

	score = 0;
	for (int i = 0; i < left.size(); i++)
	{
		int repeat = std::count(right.cbegin(), right.cend(), left[i]);
		score += left[i] * repeat;
	}
	std::cout << "Part 2: " << score << '\n';

	return 0;
}