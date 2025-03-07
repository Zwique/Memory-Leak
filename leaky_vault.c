#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Explicitly declare gets to avoid the implicit declaration warning
char* gets(char* str);

void win() {
    printf("Debug: win function started\n");
    char* flag = "uacCTF{m3m9ry_l2ak_3xpl0it_CS1410}";
    printf("%s", flag);
    exit(0); // Exit cleanly after printing the flag
}

void vuln() {
    char buffer[64];
    printf("Enter your input: ");
    gets(buffer); // Vulnerable function
    printf("You entered: %s\n", buffer);
}

int main() {
    vuln();
    return 0;
}
