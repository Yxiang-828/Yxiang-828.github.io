#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <math.h>
#include "md5.h"

#define FLAG "[REDACTED]"

void setup() {
  setbuf(stdin, 0);
  setbuf(stdout, 0);
}

int main() {
    setup();
    time_t raw;
    time(&raw);
    printf("Server connected.\n");
    printf("%s\n", asctime(localtime(&raw)));
    srand(time(NULL));
    int random = rand();
    char key[(int)((ceil(log10(random))+2)*sizeof(char))];
    sprintf(key, "%d", random);
    unsigned char result[16];
    md5String(key, result);
    char md5string[33];
    for(int i = 0; i < 16; ++i)
        sprintf(&md5string[i*2], "%02x", (unsigned int)result[i]);

    char input[33];
    printf("Welcome!\n");
    printf("A random admin hash has been generated for you, and you should be able to see it on your hardware encryption device.\n");
    printf("Please enter the admin hash handed to you.\n");
    printf("Input Hash:\n");

    read(STDIN_FILENO, input, 33);
    fflush(stdin);

    if (!strncmp(input, md5string, 32)) {
        printf("Good job!\n");
        printf("Flag: %s", FLAG);
    } else {
        printf("Wrong hash! A report has been generated and sent to our admins.\n");
    }
}