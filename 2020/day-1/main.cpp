#include<print>
#include<vector>
#include<fstream>
#include<string>

int part1(const std::vector<int>& nums)
{
	for (int index1 = 0; index1 < nums.size(); ++index1)
	{
		for (int index2 = 1; index2 < nums.size(); ++index2)
		{
			if (nums[index1] + nums[index2] == 2020)
				return nums[index1] * nums[index2];
		}
	}
}

int part2(const std::vector<int>& nums)
{
	for (int index1 = 0; index1 < nums.size(); ++index1)
	{
		for (int index2 = 1; index2 < nums.size(); ++index2)
		{
			for (int index3 = 2; index3 < nums.size(); ++index3)
			{
				if (nums[index1] + nums[index2] + nums[index3] == 2020)
					return nums[index1] * nums[index2] * nums[index3];
			}
		}
	}
}

int main()
{
	std::ifstream file{ "day1.txt" };
	if (!file.is_open())
		return -1;

	std::string line;
	std::vector<int> nums;
	while (std::getline(file, line))
		nums.push_back(std::stoi(line));

	std::println("Part 1: {0}", part1(nums));
	std::println("Part 2: {0}", part2(nums));
	return 0;
}
