#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define ASCII_LETTERS "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
#define DIGITS "0123456789"
#define PUNCTUATION "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"

void generate_password(int pass_number, int pass_length) {
    char chars[strlen(ASCII_LETTERS) + strlen(DIGITS) + strlen(PUNCTUATION) + 1];
    strcpy(chars, ASCII_LETTERS);
    strcat(chars, DIGITS);
    strcat(chars, PUNCTUATION);
    char password[pass_length + 1];
    int i, j;
    srand(time(NULL));
    for (i = 0; i < pass_number; i++) {
        for (j = 0; j < pass_length; j++) {
            password[j] = chars[rand() % (strlen(chars) - 1)];
        }
        password[pass_length] = '\0';
        printf("SENHA %d GERADA: %s\n", i + 1, password);
    }
}

int main() {
    printf("|---------------------------------------------------------|\n");
    printf("|                          Draius                         |\n");
    printf("| ☢ ☢ ☢ ☢ ☢ ☢ ☢           𓅓  𓅓  𓅓           ☢ ☢ ☢ ☢ ☢ ☢ ☢ |\n");
    printf("|                        PASS WORDS                       |\n");
    printf("|---------------------------------------------------------|\n");

    int pass_number, pass_length;
    printf("NÚMERO DE SENHAS GERADAS: ");
    scanf("%d", &pass_number);
    printf("QUANTIDADE DE CARACTERES: ");
    scanf("%d", &pass_length);
    if (pass_length < 1 || pass_number < 1) {
        printf("O NÚMERO E O COMPRIMENTO DEVEM SER POSITIVOS");
        return 1;
    }
    printf("\n");
    generate_password(pass_number, pass_length);
    return 0;
}
