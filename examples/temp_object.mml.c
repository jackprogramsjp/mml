#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    char *print_statement_output_1 = (char *)malloc(sizeof(*print_statement_output_1) * 16);
    /* char print_statement_output_1[16]; if heavily optimized */

    strcpy(print_statement_output_1, "hello world");
    strcat(print_statement_output_1, " hey");

    puts(print_statement_output_1); /* kind of optimized here, changed from printf("%s\n") to puts() */
    free(print_statement_output_1); /* temporary object freed after use, (not freed if uses buffer/array instead) */

    return 0;
}
