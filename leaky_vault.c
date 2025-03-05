#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void win() {
    char flag[100];
    FILE *fp = fopen("flag.txt", "r");
    if (fp == NULL) {
        printf("Flag file not found!\n");
        exit(1);
    }
    fgets(flag, sizeof(flag), fp);
    printf("%s", flag);
    fclose(fp);
}

void vuln() {
    char buffer[64];
    printf("Enter your input: ");
    gets(buffer);
    printf("You entered: %s\n", buffer);
}

int main() {
    vuln();
    return 0;
}
