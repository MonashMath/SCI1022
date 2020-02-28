# Static vs dynamic languages

A programming language consist of instructions for computers. They allow us to 
implement algorithms. There are different adjectives that can be used together with
a programming language. A language can be either *static* or *dynamic*. A *static* language
enforces the developed to declare the type of any variable. E.g., if we want to
declare an integer variable `age` with value `4` we could write in `C`
```c
int age1;
int age2;
int diff;

age1 = 10;
age2 = 20;
diff = substract(age2,age1);
```
When one declares a function, the type of all arguments and the type of the output must also be explicitly declared
```c
int subtract(int num1, int num2)
{
   int result
   result = num1-num2;
   return result
}    
```
All this information is used by a static compiler. Once you have finished your code, you must compile
it. Compilers transform the code written in a static language into
machine code to create an executable program. Compilers can exploit 
different types of optimisation to generate highly efficient code.
Thus, static languages are used in the industry and academy when 
performance is a requirement, e.g., when implementing computationally
intensive algorithms. The most important static languages are `C`, `C++` and `FORTRAN`.



# Python

Python is one the most popular language for scientific coding, 
especially for data science. It is widely used both in academia and industry 
because of its simplicity and flexibility. Python is an object-oriented language, 
and probably the best one for learning this programming 
paradigm. Python is general purpose and can be used in any scientific discipline, from 
computational mathematics and physics to data science. Python is a 
community-driven open source project, with thousands of freely available
packages in almost any discipline.

# Matlab

*Matlab* is a commercial numerical computing environment that is easy to learn and use, 
and is a very popular at undegraduate university programmes, especially in mathematics 
and some engineering disciplines. It might be easier for beginners. However, it is a 
propietary language. The basic package comes with algebra, data processing and plotting tools.
Extra functionality is provided by Mathworks through toolkits (at an extra cost).

# R

R is an open source language and environment for statistical computing and graphics. 
R provides a wide variety of statistical and graphical techniques, and is highly extensible.
It is widely used in data science and applications in almost any discipline, e.g., biology, chemistry, etc.
In the field of data science, one can find a freely available package for almost anything.

# Mathematica

Mathematica is a propietary program which is particularly well-suited for symbolic computations.
It can be of interest for undergraduate students in mathematics that require to make intensive use
of symbolic computation. Mathematica is much less common in scientific computing and data science
fields. On the downside, Mathematica licenses are very expensive.
