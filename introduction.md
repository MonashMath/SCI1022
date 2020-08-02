
# Introduction to computers

A [computer](https://en.wikipedia.org/wiki/Computer) is made of different devices, called _hardware_ (the central processing unit or CPU, memory devices as the RAM main memory or hard disk, output devices as a screen or printer, etc). The [CPU](https://en.wikipedia.org/wiki/Computer#Central_processing_unit_(CPU)) or _central process unit_ is the core of the computer and the one that runs programs. Modern CPUs are _microprocessors_. Then, we have the main memory, or _random-access memory_ or _RAM_. This memory can be quickly accessed by the CPU at any (random) location, but is _volatile_ (temporary) memory that is used while running a program and erased when shutting off a machine. The _hard disk_ is a secondary storage device that holds data in a persistent (long term) way. Programs are usually stored in this device, and loaded to RAM as needed. Then, we have input devices (keyboard, mouse, etc) and output devices (screen, printer, etc).

Computer memory is split into cells called _bytes_. It is the minimum unit of memory you can address in a computer. A bit contains eight _bits_ and used to encode a single number or character. A _bit_ represents a _binary digit_ (i.e., 0 or 1). Thus, each bit is a two-state device (0 or 1), which can have different physical representations (a positive or negative charge, two directions or magnetisation or polarisation, etc). It is related to the 0 (off) and 1 (on) in [switches](https://en.wikipedia.org/wiki/Power_symbol). You can understand a

> *__Note:__ If you are not familiar with [binary numbers](https://en.wikipedia.org/wiki/Binary_number) or base-2 numerals, let me provide a short introduction. In the binary system, the only digits are 0 and 1 (in the decimal system you are used to there are 10 digits, i.e., 0,1,2,3,4,5,6,7,8,9). We all know that the number 12304 in the decimal system is 10000+2000+3000+4 or analogously, 1\*10^4+2\*10^3+3\*10^2+0\*10^1+4\*10^0. So, the number 10110 is 1\*2^4+0\*10^3+1\*10^2+1\*10^1+0\*10^0, which in decimal system is 22.* 

> *__Exercise:__ What is the largest number that can be stored with 8 bits (1 byte)? It is 11111111 in binary system, which represents 2^0+2^1+2^2+2^3+2^4+2^5+2^6+2^7 = 255. With 8 bits you can represent the 256 integers 0, 1, ..., 255. If you need to store larger numbers, you will use 2-bytes or 16-bit (representing integers till 65535), 32-bits, 64-bits, etc.*

> *__Note:__ The previous exercise assumes you are only interested in zero and positive integers (a.k.a. unsigned). If you want to represent positive and negative numbers (a.k.a. signed), we conceptually need to keep one bit for the sign, limiting the maximum number we can represent. See [here](https://en.wikipedia.org/wiki/Integer_(computer_science)) for more details.*

> *__Note:__ Real numbers (a.k.a. _floating point_ numbers) are also represented in a computer using a binary base. In a nutshell, we write our number in [scientific notation](https://en.wikipedia.org/wiki/Scientific_notation), e.g., 120.95 is 1.2095 x 10^2 or simply 1.2095E2, using some bits for the binary representation of the exponent, other set of bits for the so-called _significant_, and one bit for the sign. Reals or floats are usually stored using 64-bits.*

Not only numbers but _anything_ stored in a computer is written in terms of 0s and 1s. E.g., each alphabet character is represented by a number stored in the computer as a set of bites. This translation between characters and numbers is called a _character set_. The most famous character set is _ASCII_ (in which A is 65 or 01000001, B is 66 or 1, C is 67, ...). However, ASCII only represents 128 English letters, some punctuation marks and other additional characters (it uses 7 bits of a byte, thus it can only represent 128 characters). _Unicode_ was developed in the 1990s to overcome this limitation, which represents languages for many languages in the world and is becoming the standard character set (it uses 16 bits, and thus can represent 65535 characters).

> *__Exercise:__ Google ASCII codes to find the numeric representation of symbols in a computer. Next, take a look at the Unicode list of characters.*

But we can go much further than numbers and characters in a computer, as you know. We can transform many things into _digital data_ (a bite-based representation). An image in a computer is nothing but an array of numbers, in which each number in the matrix represents a color for each pixel in your screen (those tiny dots). Colors are thus represent by a numeric code. One can consider 8 bits per pixel (256 colors), 16 bits per pixel (65536 colors), 24 bits per pixel (16777216 colors, also known as _true color_), etc. The same idea applies for sounds and _samples_.


# Programs

As you probably know, computers can do lots of different things for you, because they can be _programmed_. The program is __a collection of instructions that can be executed by the CPU to perform a specific task.__ Each __instruction__ tells the CPU to perform a basic operation. 

The CPU is an electronic device that has been designed to carry out _some very specific_ operations. A CPU works in [_instruction cycles_](https://en.wikipedia.org/wiki/Instruction_cycle): 1) an instruction is _fetched_ from memory; 2) the instruction is _decoded_; 3) the instruction is _executed_. 
The kind of instructions that an CPU can perform is very limited. 

The CPU can perform __basic arithmetic operations__ (addition, subtraction, multiplication or division of two numbers), __memory operations__ reading a piece of memory or moving data from one location to another) and __logical operations__ (test whether two values are equal). However, CPUs can perform these operations extremely fast. 

Computers only understand _machine code_ (a list of 0s and 1s, the _machine language_). Each basic operation a CPU can perform can be expressed in machine language (via a binary structure, 0s and 1s). The set of _CPU_ instructions is the _CPU instruction set_ (which differs from one brand to another, e.g., the one for Intel is different from the one for AMD).

A computer requires _software_ (collection of programs) to run. We can distinguish among _system software_ (the operating system, e.g., Windows, macOS, Linux, assemblers, compilers, interpreters) and _applications_ (Zoom, Chrome, Word, Acrobat, etc). In this unit, we will be focused on scientific programming, i.e., programs that solve scientific problems.

# Programming languages

As we have seen above, machines can only understand machine code, but programming straight in machine code (in terms of 0s and 1s) is extremely hard for humans. It is clear that we need a translator between humans and computers. In the origins of computation, _assembly language_ was created to replace binary numbers by easier to digest expressions (e.g., `add` to add, `mul` to multiply, `mov` to move in memory) and an _assembler_ translated this keys into machine language to be processed by the computer. However, assembly language is a very hard low-level language that is specific to a CPU architecture and requires a deep understanding of the CPU.

You are fortunate. In SCI1022, we will teach you _high-level languages_. High-level languages are more expressive (you can implement complex programs in few lines), CPU architecture-independent and much easier to understand by humans. 
+

As an example, if I want to create a Linux-compatible program that prints `Hello world` in assembly language, it would read
```
;Copyright (c) 1999 Konstantin Boldyshev <konst@linuxassembly.org>
;
;"hello, world" in assembly language for Linux
;
;to build an executable:
;       nasm -f elf hello.asm
;       ld -s -o hello hello.o

section .text
; Export the entry point to the ELF linker or loader.  The conventional
; entry point is "_start". Use "ld -e foo" to override the default.
    global _start

section .data
msg db  'Hello, world!',0xa ;our dear string
len equ $ - msg         ;length of our dear string

section .text

; linker puts the entry point here:
_start:

; Write the string to stdout:

    mov edx,len ;message length
    mov ecx,msg ;message to write
    mov ebx,1   ;file descriptor (stdout)
    mov eax,4   ;system call number (sys_write)
    int 0x80    ;call kernel

; Exit via the kernel:

    mov ebx,0   ;process' exit code
    mov eax,1   ;system call number (sys_exit)
    int 0x80    ;call kernel - this interrupt won't return
```
whereas in an advanced and expressive up-to-date language (Python), it would just read
```
print 'Hello world'
```

There are thousands of high-level programming languages. The first one was `FORTRAN`, which dates back to the 1950s, and still in use (in updated forms). `FORTRAN` was created for scientific applications (its name comes from FORmula TRANslator). The most popular languages nowadays are `C`/`C++`, `Java` and `Python`. `C` was created in the 70s, and its successor `C++` is from the 80s. `Java` is primarily used to create web applications. `Python` is a multi-purpose language that is very popular in science and industry. However, programming languages are evolving (new versions, like `Python 3.0` in 2008), new languages are born (like `Go` or `Julia`) and others are just disappearing (like `Basic`).

Each programming language has its _keywords, operators, and syntax_ (pretty much like human languages, leaving operators aside). For instance, examples of `Python` keywords are `if`, `else`, `for` and operators are `+`, `**`, `==`. The syntax is a set of rules that determine how a program must be written. For instance, `Python` uses indentation to define blocks of code (e.g., code to run if a condition holds)
```
n=2
if n>3 :
  print("Hello!")
```
Instead, this code does not respect the `Python` syntax and will return a syntax error
```
n=2
if n>3 :
print("Hello!")
```

## Compilers vs. interpreters

As commented above, high-level languages must be translated into machine code in order to be executed. There are two big families of high-level languages: _compiled_ languages and _interpreted_ languages. The difference between them is the _translator_, which in the first case is a [_compiler_](https://en.wikipedia.org/wiki/Compiler) and in the second one is an [_interpreter_](https://en.wikipedia.org/wiki/Interpreter_(computing)). As we note below, this is not the only possible classification of programming languages.

A compiler translates the _whole_ high-level language program into a machine code program (an _executable_). The machine program is created _before run-time_ (i.e., execution), and it can be then executed as many times as one wants. `C`, `C++` or `FORTRAN` are compiled languages. On the contrary, an interpreter reads each individual instruction in a high-level program, translates it to a machine code, executes, and proceeds to do the same of the next instruction; translation is during run-time. They do not create an executable, and must translate the code every time they are run. `Python`, `Matlab`, `R` and `Mathematica` are an interpreted languages.

The high-level language written by the programmer (you) is the _source code_. It is written using a text editor to create raw text file(s). The programmer may make use of a compiler to translate the source code or an interpreter to translate and execute it. If the code contains syntax errors (bugs), the compiler or debugger will return a syntax error (in compilation time), and the programmer has to fix it to proceed any further. As an example, when trying to compile this `C` code, the compiler will throw an error the addition if integers and strings is not defined, even though the code would never execute the rogue instruction.
```c
int age1 = 10;
char str[] = "hello";
int my_age
if (age1 > 10)
{
   my_age = age1+str;
}
```
When using an interpreter, the errors will be triggered during run-time (execution time). n this `Python` code (which makes use of an interpreter), we will be able to go through this code without any issue, because the rogue line will never be executed.
```python
age1 = 10
str = "hello"
if age1 > 10:
  my_age = age1+str
```
A code can also contain other kinds of errors, e.g., mathematical errors (you are not really computing what you should). These errors are silent errors that a compiler or debugger cannot detect, and many times are hard to find. The process of finding errors (bugs) in a code is called _debugging_. Programmers have at their disposal tools to navigate through their codes in the search of bugs, called _debuggers_. Debugging is a tedious but common part of programming.

## Dynamic vs static languages

In this section we consider another taxonomy of programming languages accordingly to the way data types of variables are handled. Accordingly to this taxonomy, a language can be either *statically-typed* or *dynamically-typed*, or *static* or *dynamic*, respectively, for short. Generally speaking, static codes are compiled and dynamic codes are interpreted, and you can think that static-compiled and dynamic-interpreted are the same at this level.

In order to check types before running the code, a *static* language compels the developer to declare the type of any variable. For example, if we want to declare integer variables in our [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) code we would write:
```c
int age1;
int age2;
int diff;

age1 = 10;
age2 = 20;
diff = substract(age2,age1); // Function call that substracts age1 to age2
```
All this type information is required by a [**static compiler**](https://en.wikipedia.org/wiki/Compiler) in order to transform the code written in a static language into machine code. Compilers can exploit different kinds of optimisation to generate highly efficient code. Thus, static languages are used in the industry and academy when _performance_ is a requirement, e.g., when implementing computationally intensive algorithms. The most important static languages are [`C`](https://en.wikipedia.org/wiki/C_(programming_language)), [`C++`](https://en.wikipedia.org/wiki/C%2B%2B) and [`Fortran`](https://en.wikipedia.org/wiki/Fortran); [`Fortran`](https://en.wikipedia.org/wiki/Fortran) was the first commercially available programming language, developed from inception for mathematical computations, but its usage is continuously decaying. 

However, the performance of static languages comes with a price. The learning curve is very steep and the productivity of developers can be very low. The programmer must declare the types of all the variables in a code, which makes code development quite tedious. The compilation step can also take a considerable amount of time. 

On the other side of the spectrum, we have the *dynamic languages*. Dynamic languages (e.g., [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)), [`R`](https://en.wikipedia.org/wiki/R_(programming_language)), [`MATLAB`](https://en.wikipedia.org/wiki/MATLAB), do not require type declaration, which prevents the possibility to have a pre-compilation step; one cannot generate machine code if the types of the variables are unknown. Instead, the code is **interpreted** at run-time using an special program called [**interpreter**](https://en.wikipedia.org/wiki/Interpreter_(computing)). 

One could write the previous [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) code in [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) as
```python
age1 = 10
age2 = 20
def diff(num1,num2): return num1-num2
diff(age2,age1)
```
These languages are more expressive, drastically increasing the productivity of developers. The price to pay is a (in many cases unacceptable) performance hit that can easily be of the _order of hundreds_.

In this unit, we will focus on dynamic languages, since the performance hit is not an issue, in general, in undergraduate scientific projects and some scientific tasks. In any case, one can combine the productivity of dynamic languages with the performance of static languages by using pre-compiled external libraries (written in [`C`](https://en.wikipedia.org/wiki/C_(programming_language)), [`C++`](https://en.wikipedia.org/wiki/C%2B%2B), or [`Fortran`](https://en.wikipedia.org/wiki/Fortran)) for the computationally intensive kernels. One ubiquitous approach is to combine [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) code with the [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) library [NumPy](https://numpy.org/) for array computations (you will do this in the `Python` workshop). In order for this approach to work, [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) code must involve vectorisation, e.g., operations are applied to whole arrays instead of individual entries.

The static vs. dynamic paradigms, code productivity and performance are serious issues to be considered when creating scientific software projects. There is no *the best* alternative, since it is very case-dependent. Analogously, it is hard to decide which is *the best* static or dynamic programming language, since it depends on the type of work to be performed. 

## Just-in-time compilation

In fact, new programming languages are being created to solve the drawbacks of existing approaches. There is a third family of programming languages that are compiled in run-time. This is called just-in-time (JIT) compilation. A JIT compiler is somewhere between a static compiler (because it compiles blocks of code being used in a run) and an interpreted (because it compiles in run-time).

[`Julia`](https://julialang.org/) deserves special mention in the frame of scientific coding. It is a dynamic language originated in 2011 at MIT that does not suffer the performance hit. It involves JIT compilation and the user can decide whether to annotate the type of a variable (in key places, for performance, like in static languages) or not (so-called _duck typing_, as in dynamic languages).

# The four elective modules
<a id="markdown-the-four-elective-modules" name="the-four-elective-modules"></a>

SCI1022 includes four different workshops on three dynamically-typed languages, namely, [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)), [`MATLAB`](https://en.wikipedia.org/wiki/MATLAB), [`R`](https://en.wikipedia.org/wiki/R_(programming_language)), and an untyped language, [`Mathematica`](https://en.wikipedia.org/wiki/Wolfram_Mathematica). Below, we provide a description of the four different languages that would help students to pick the ones that better fit their requirements. You can do your own research, in order to decide which is the right language for you. There are also different indices that measure the _popularity_ of programming languages, e.g., the [TIOBE index](https://en.wikipedia.org/wiki/TIOBE_index). You can find the ranking [here](https://tiobe.com/tiobe-index/).

Below is a very short description of the four languages being offered. More detailed information can be found in the respective Moodle pages.

## `Python`

[`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is the most popular languages for scientific coding, especially for data science. It is widely used both in academia and industry because of its simplicity and flexibility. [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is an object-oriented language, and probably the best one for learning this programming paradigm. Python is general purpose and can be used in any scientific discipline, from computational mathematics and physics to data science. [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is a community-driven open source project, with thousands of freely available packages in almost any discipline.

## `MATLAB`

[`MATLAB`](https://en.wikipedia.org/wiki/MATLAB) is a commercial numerical computing environment that is easy to learn and use. It is very popular at undergraduate university programmes, especially in mathematics and some engineering disciplines, and used in some research areas. The basic package comes with linear algebra, data processing and plotting tools. Extra functionality is provided by Mathworks through toolkits. Monash has a `MATLAB` site-license that allows Monash students to install it on their personal computers.

## `R`

[`R`](https://en.wikipedia.org/wiki/R_(programming_language)) is an open source language and environment for statistical computing and graphics. [`R`](https://en.wikipedia.org/wiki/R_(programming_language)) provides a wide variety of statistical and graphical techniques, and is highly extensible. It is widely used in data science and applications, e.g., in biology or chemistry. In the field of data science, one can find a freely available package for almost anything.

## `Mathematica`

[`Wolfram Mathematica`](https://en.wikipedia.org/wiki/Wolfram_Mathematica) is a proprietary program which is particularly well-suited for symbolic computations. It is an untyped language. It can be of interest for undergraduate students in mathematics and physics which require to make intensive use of symbolic computation. Monash has a `Mathematica` site-license that allows Monash students to install it on their personal computers.

