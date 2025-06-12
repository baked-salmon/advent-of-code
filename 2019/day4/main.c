#include <stdio.h>
#include <stdbool.h>

int part1(int lowRange, int highRange) {
    int current = lowRange;
    int amount = 0;
    int digits[6] = {0};
    while (current < highRange) {
        bool twice = false;
        bool increase = true;
        int index = 6;
        int number = current;
        while (number > 0) {
            int digit = number % 10;
            number /= 10;
            digits[index-1] = digit;
            index--;
        }
        for (int i = 0; i < 5; i++) {
            if (digits[i] == digits[i + 1]) {
                twice = true;
                break;
            }
        }
        int highest = digits[0];
        for (int i = 0; i < 5; i++) {
            if (highest <= digits[i+1]) {
                highest = digits[i+1];
            }
            else {
                increase = false;
            }
        }
        if (twice && increase) {
            amount++;
        }
        current++;
    }
    return amount;
}

int main(void) {
    printf("Part1: %d\n", part1(156218, 652527));
    return 0;
}