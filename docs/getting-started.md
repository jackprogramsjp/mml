---
title: Getting Started
---

MML is a programming language that deals with memory implicitly. It does not use a garbage collector, though it remembers when you use a memory and to free it at the end of the scope, like RAII. It also is supposed to make sure there is no memory leak if you do explicitly allocate memory. This language tries its best to use as little memory as possible, and to compile it to human-readable C code.

MML transcompiles to C, where then it would be compiled to native code.

Here is an example of a hello world MML code:
```mml
function main() {
    println 'Hello, world!';
}
```
This MML code transcompiles to this C code:
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    char *println_statement_output_1 = (char *)malloc(sizeof(*println_statement_output_1) * 16);
    /* char println_statement_output_1[16]; if heavily optimized */

    strcpy(println_statement_output_1, "hello world");
    puts(println_statement_output_1); /* kind of optimized here, changed from printf("%s\n") to puts() */
    free(println_statement_output_1); /* temporary object freed after use, (not freed if uses buffer/array instead) */

    return 0;
}
```
MML is really just another programming language, similar to other languages like C++, Java, etc.

<button type="button" onclick="location.href='installation'">Installation</button>