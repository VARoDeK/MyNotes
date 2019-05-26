# Checking for function symbols.
---
**Note:** The definitions may be bit wrong. But the steps to use `nm`, are correct.
---
## nm
It lists symbols from object file.

**Now what is object file?**

In case of C/C++, when you compile a program, you get a `a.out` file. You can call it as your object file.

**What are the `symbols` we are talking about?**

The functions you defined in your C/C++ file are saved in form of the symbols, this is what we are talking about. nm can detect them.
---
## Steps
* Locate the directory where your object file is present.
* Chand your directory to that using `cd`.
* run: `$ nm -A ./*.o | grep <function name you want to search>`.

