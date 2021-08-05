#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    char *str = (char *)malloc(100);
    strcpy(str, "hello world");

    puts(str);

    free(str);
}
