# CIS-206-Assembly-Programming

C is a compiled language meaning your code is translated to assembly and then machine code before it is run.

This is in contrast to interpreted languages (like python or javascript) which run code files directly through an interpreter.

# Memory Management
Memory is managed (allocated and freed) manually by you in C. This is incontrast to almost every other language that come with a garbage collector that performs that function for you. 

This makes the C language require a more minimal runtime that other languages where the garbage collector adds a significant amount of overhead.

# Statically Typed
Once you create a variable and give it a type, you cannot change the type of that variable. You can change the assigned value however.

```
// you must choose a data type to give a variable before you use it
int x = 42;

x = "forty two"; // not allowed 
```
There are a few exceptions and those have to do with how char and bool values are stored (as int).
```
bool conditionalStatement = true; // these are both interpreted as true
int conditionalStatementInt = 1; these are both interpreted as true

// these would be interpreted the same way
if(1) { // always be true
    ... // this code will always execute
}

if(true) { // always be true
    ... // this code will always execute
}
```

# C is (was) a High-Level (of Abstraction) Language
At the time that it was released in 1972 it was considered a High-Level Language because it was closer to human abstractions of reasoning than any previous programming language. This is because it allowed programmers to write human readable code that would be translated to Assembly. In fact, it's nickname was 'Portable Assembly".

Today, C is considered a Low-Level Language, compared to more modern languages like Java and Python, because it sits closer to system components, like memory, than those languages.

Before C, programmers had to write Assembly and other non-human-friendly languages. C vastly improved the quality of life of software developers when it was released.

Because it is so close to system resources, C programs, execute more quickly/efficiently that other languages and to this day, still underly much of our modern computing environments.

# How C becomes an executable
0. You write code
1. You begin compiling the code
2. The compiler handles preprocessor statements like #include
3. Actual compilation begins (C becomes Assembly)
4. Linking (Creates the executable)

# How to Compile C
```bash
gcc file.c # produces file.o (executable)
gcc file.c -o output.o # produces output.o
gcc file.c -S # produces file.S (Assembly)
gcc filename.c -S -fverbose-asm # produces assembly w/ Comments
xxd output.o # produces hex code
xxd -b output.o # produces binary code
```