#include <stdio.h>
#include <stdlib.h>

int BUFFER = 10;

int part1() {
    int fuel = 0;
    FILE *ptr = fopen("input.txt", "r");
    char line[BUFFER];
    while (fgets(line, BUFFER, ptr)) {
        int number = atoi(line);
        number = number/3 - 2;
        fuel += number;
    }
    return fuel;
}

int part2() {
    int fuel = 0;
    FILE *ptr = fopen("input.txt", "r");
    char line[BUFFER];
    while (fgets(line, BUFFER, ptr)) {
        int number = atoi(line);
        while (1) {
            number = number/3 - 2;
            if (number > 0) {
                fuel += number;
            } else {
                break;
            }
        }
    }
    return fuel;
}

int main(void) {
    printf("%d\n", part1());
    printf("%d\n", part2());
    return 0;
}