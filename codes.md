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

However, this performance comes with a price. To develop code in static languages is a complicated task. The learning curve is very steep and the productivity of developers can be very low. First, the compilation step can take a considerable amount of time, and second, the need to declare all types and interfaces makes the code development quite tedious.

On the other side, we have the *dynamic languages*. Dynamic languages often do not require type declaration and do not involve a pre-compilation step. Instead, the code is interpreted at run-time using a `eval` function. One could write the previous `C` code in `Python` as
```python
age1 = 10
age2 = 20
diff(num1,num2) = num1-num2
diff(age2,age1)
```
These languages are more expressive, drastically increasing the productivity of developers. The price to pay is a (in many cases unacceptable) performance hit.

In this unit, we will focus in dynamic languages, since the performance hit is not an issue, in general, in undergraduate scientific projects. In any case, one can combine the productivity of dynamic languages with the performance of static languages by using pre-compiled external libraries (written in `C`, `C++`, or `FORTRAN`) for the computationally intensive parts of the code. One obiquitous approach is to combine `Python` code with the `C` library [NumPy]{https://numpy.org/} for array computations. In order for this approach to work, `Python` code must involve vectorisation, e.g., operations are applied to whole arrays instead of individual entries.

The static vs. dynamic paradigms, code productivity and performance are serious issues to be considered when creating scientific software projects. There is no *the best* alternative, since it is very case-dependent. Analogously, it is hard to decice which is *the best* static or dynamic programming language, since it depends on the type of work to be performed. In fact, new programming languages are created all the time to solve the drawbacks of existing approaches. [Julia]{julialang.org} deserves special mention in the frame of numerical coding. It is a dynamic language that started in 2011 at MIT that does not suffer the performance hit.

For all these reason, SCI1022 includes four different workshops on three dynamically-typed languages, namely, `Python`, `Matlab`, `R` and an untyped language, `Mathematica`. Below, we provide a description of the four different languages that would help students to pick the ones that better fit their requirements.

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

Matlab is a commercial numerical computing environment that is easy to learn and use, 
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
