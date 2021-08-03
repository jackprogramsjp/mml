#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MEMORY_MULTIPLIER_SIZE 16

int main(void) {
    char *line, *print_statement_output_1;
    int c_temp;
    size_t line_current_length, c_temp_pos = 0;

    fputs("Enter name: ", stdout);
    fflush(stdout);

    line_current_length = MEMORY_MULTIPLIER_SIZE;
    line = (char *)malloc(sizeof(*line) * (line_current_length + 1));

    while ((c_temp = getchar()) != EOF && c_temp != '\n') {
        if (c_temp_pos++ > line_current_length) {
            char *temp;
            line_current_length *= 2;
            if ((temp = realloc(line, sizeof(*line) * (line_current_length + 1))) == NULL) {
                fputs("Error: memory failed to reallocate, cannot continue", stderr);
                abort();
            }
            line = temp;
            line[c_temp_pos] = c_temp;
        } else {
            line[c_temp_pos] = c_temp;
        }
    }

    line[++c_temp_pos] = '\0';
    
    print_statement_output_1 = (char *)malloc(sizeof(*print_statement_output_1) * (16 + line_current_length + 1));

    strcpy(print_statement_output_1, "Hello ");
    strcat(print_statement_output_1, line);
    strcat(print_statement_output_1, ", what's up?");

    puts(print_statement_output_1);
    free(print_statement_output_1);

    free(line);
}
