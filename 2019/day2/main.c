#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int BUFFER = 300;

int *parseFile(const char *fileName, int* size) {
    FILE *fptr = fopen(fileName, "r");
    char line[BUFFER];
    fgets(line, BUFFER, fptr);
    line[BUFFER] = '\0';
    int *ptr = malloc(BUFFER*sizeof(int));
    int count = 0;
    char *token = strtok(line, ",");
    while (token) {
        int number = atoi(token);
        ptr[count] = number;
        count++;
        token = strtok(NULL, ",");
    }
    *size = count;
    int* ptr2 = malloc(count*sizeof(int));
    memcpy(ptr2, ptr, count*sizeof(int));
    free(ptr);
    return ptr2;
}

int part1(int* array, int size, int noun, int verb) {
    int* array2 = malloc(size*sizeof(int));
    memcpy(array2, array, size*sizeof(int));
    array2[1] = noun;
    array2[2] = verb;
    for (int i = 0; i < size; i+= 4) {
        if (array2[i] == 1) {
            array2[array2[i+3]] = array2[array2[i + 1]] + array2[array2[i + 2]];
        } else if (array2[i] == 2) {
            array2[array2[i+3]] = array2[array2[i + 1]] * array2[array2[i + 2]];
        } else {
            break;
        }
    }
    int pos0 = array2[0];
    free(array2);
    return pos0;
}

int part2(int* array, int size, int output) {
    for (int noun = 0; noun <= 99; noun++) {
        for (int verb = 0; verb <= 99; verb++) {
            if (part1(array, size, noun, verb) == output) {
                return (100 * noun + verb);
            }
        }
    }
    return -1;
}

int main(void) {
    int size;
    int *array = parseFile("input.txt", &size);
    printf("Part1: %d\n", part1(array, size, 12, 2));
    printf("Part2: %d\n", part2(array, size, 19690720));
    free(array);
    return 0;
}