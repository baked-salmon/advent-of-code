#include <fstream>
#include <iostream>
#include <vector>
#include <string>

void countCalories(const std::vector<std::string>& list, std::vector<int>& elfs)
{
	int tempCals = 0;
	for (const auto& calorie : list)
	{
		if (calorie.empty())
		{
			elfs.push_back(tempCals);
			tempCals = 0;
		}
		else if (std::stoi(calorie))
		{
			tempCals += std::stoi(calorie);
		}
	}
}

int threeHighest(const std::vector<int>& elfs)
{
	int highest = elfs[0];
	for (int i = 1; i < elfs.size(); i++)
	{
		if (highest < elfs[i])
		{
			highest = elfs[i];
		}
	}

	int medium = elfs[0];
	for (int i = 1; i < elfs.size(); i++)
	{
		if (medium < elfs[i] && elfs[i] != highest)
			medium = elfs[i];
	}

	int low = elfs[0];
	for (int i = 1; i < elfs.size(); i++)
	{
		if (low < elfs[i] && elfs[i] != medium && elfs[i] != highest)
		{
			low = elfs[i];
		}
	}

	int total = low + medium + highest;
	return total;
}

int findHighest(const std::vector<int> elfs)
{
	int high = elfs[0];
	for (int i = 1; i < elfs.size(); i++)
	{
		if (high < elfs[i])
			high = elfs[i];
	}
	return high;
}

void fileParse(const std::string& filename, std::vector<std::string>& list)
{
	std::fstream file(filename);
	if (!file.is_open())
	{
		std::cerr << "Couldn't not open file\n";
		exit(-1);
	}
	std::string line;
	while (std::getline(file, line))
	{
		list.push_back(line);
	}
}

int main()
{
	std::vector<std::string> list;
	std::vector<int> elfs;
	fileParse("day1.txt", list);
	countCalories(list, elfs);
	std::cout << "highest: " << findHighest(elfs) << '\n';
	std::cout << "Sum of highest three: " << threeHighest(elfs) << '\n';
	return 0;
}
