---
title: Importing C code
---

You have the ability to import C code, since MML itself transpiles to C.

All you need to do is to use the `import` keyword, and declare it with `'C'`.

Here's an example of importing C code:
```cpp
import cmain;

import 'C' {
    int add(int a, int b) {
        return a + b;
    }
}

function main() {
    cmain.int $result = C.add(1, 1)
    println $result;
}
```

In order to use the C code/functions, you have to declare `C` first (e.g. `C.function()`). This is so MML code and C code doesn't interfere with each other.

The rest should be self-explanatory.
