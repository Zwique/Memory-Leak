#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* gets(char* str);

void secret_function() {
    printf("Congratulations! You found the secret function!\n");
    printf("Here's your flag: uacCTF{m3m9ry_l2ak_3xpl0it_CS1410}\n");
}

void vault() {
    char buffer[64];
    printf("Welcome to the Leaky Vault!\n");
    printf("Enter your name: ");
    gets(buffer); // Vulnerable function
    printf("Hello, %s!\n", buffer);
}

int main() {
    setbuf(stdout, NULL);
    vault();
    return 0;
}
