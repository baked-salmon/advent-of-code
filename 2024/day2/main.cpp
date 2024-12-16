#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>
#include <cmath>

int main()
{
	std::fstream file("input.txt");
	std::string str;
	int total = 0;
	while (std::getline(file, str))
	{
		std::string temp;
		std::vector<int> level;
		for (int i = 0; i <= str.size(); i++)
		{
			if (isdigit(str[i]))
			{
				temp += str[i];
			}
			else
			{
				level.push_back(std::stoi(temp));
				temp = "";
			}
		}
		bool increase = true;
		bool decrease = true;
		bool difference = true;
		for (int i = 0; i < level.size() - 1; i++)
		{
			if (abs(level[i] - level[i + 1]) > 3)
			{
				difference = false;
				break;
			}
			if (increase)
			{
				int largest = level[i];
				if (largest > level[i + 1])
				{
					largest = level[i + 1];
				}
				else
				{
					increase = false;
				}
			}
			if (decrease)
			{
				int smallest = level[i];
				if (smallest < level[i + 1])
				{
					smallest = level[i + 1];
				}
				else
				{
					decrease = false;
				}
			}
			if (!decrease && !increase)
				break;
		}
		if ((difference && increase) || (difference && decrease))
			total += 1;
	}
	std::cout << "Part 1: " << total << '\n';
	return 0;
}