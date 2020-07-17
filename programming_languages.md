**Authors**: [Santiago Badia](https://research.monash.edu/en/persons/santiago-badia-rodriguez), [Alberto F. Martin](https://research.monash.edu/en/persons/alberto-f-martin) 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
<!-- TOC -->

- [1. A brief overview of programming languages and the elective modules: `R`, `Python`, `MATLAB` and `Mathematica` (*20 min*).](#1-a-brief-overview-of-programming-languages-and-the-elective-modules-r-python-matlab-and-mathematica-20-min)
    - [1.1. A taxonomy of programming languages: static versus dynamic languages](#11-a-taxonomy-of-programming-languages-static-versus-dynamic-languages)
    - [1.2. The four elective modules](#12-the-four-elective-modules)
        - [1.2.1. `Python`](#121-python)
        - [1.2.2. `MATLAB`](#122-matlab)
        - [1.2.3. `R`](#123-r)
        - [1.2.4. `Mathematica`](#124-mathematica)

<!-- /TOC -->

# 1. A brief overview of programming languages and the elective modules: `R`, `Python`, `MATLAB` and `Mathematica` (*20 min*).  
<a id="markdown-a-brief-overview-of-programming-languages-and-the-elective-modules-r-python-matlab-and-mathematica-20-min" name="a-brief-overview-of-programming-languages-and-the-elective-modules-r-python-matlab-and-mathematica-20-min"></a>

A [programming language](https://en.wikipedia.org/wiki/Programming_language) consists of instructions for computers. Like natural languages, [programming languages](https://en.wikipedia.org/wiki/Comparison_of_programming_languages) are formal languages which conform to rules for syntax and semantics. They allow scientists and engineers to implement [algorithms](https://en.wikipedia.org/wiki/Algorithm).


## 1.1. A taxonomy of programming languages: static versus dynamic languages
<a id="markdown-a-taxonomy-of-programming-languages-static-versus-dynamic-languages" name="a-taxonomy-of-programming-languages-static-versus-dynamic-languages"></a>

 There are different ways to classify programming languages. In this brief introduction, we only consider a taxonomy of programming languages accordingly to the way data types of variables are handled. This taxonomy will allow us to motivate the programming languages that we have selected for SCI1022. Accordingly to this taxonomy, a language can be either *statically-typed* or *dynamically-typed*, or *static* or *dynamic*, respectively, for short. A *static* language compels the developer to declare the type of any variable. For example, if we want to declare integer variables in our [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) code we would write:
```c
int age1;
int age2;
int diff;

age1 = 10;
age2 = 20;
diff = substract(age2,age1); // Function call that substracts age1 to age2
```
When one declares a function, e.g., `substract` in the previous code, the type of all arguments and the type of the output must also be explicitly declared:
```c
int substract(int num1, int num2)
{
   int result;
   result = num1-num2;
   return result;
}    
```
All this information is used by a [**static compiler**](https://en.wikipedia.org/wiki/Compiler). Once you have finished your code, you must compile it. Compilers transform the code written in a static language into machine code to create an executable program. Compilers can exploit different types of optimisation to generate highly efficient code. Thus, static languages are used in the industry and academy when performance is a requirement, e.g., when implementing computationally intensive algorithms. The most important static languages are [`C`](https://en.wikipedia.org/wiki/C_(programming_language)), [`C++`](https://en.wikipedia.org/wiki/C%2B%2B) and [`Fortran`](https://en.wikipedia.org/wiki/Fortran); [`Fortran`](https://en.wikipedia.org/wiki/Fortran) was the first commercially available programming language, developed from inception for mathematical computations, but its usage is continuously decaying. 

However, the performance of static languages comes with a price. The learning curve is very steep and the productivity of developers can be very low. First, the compilation step can take a considerable amount of time, and second, the need to declare all types and interfaces makes the code development quite tedious.

On the other side of the spectrum, we have the *dynamic languages*. Dynamic languages (e.g., [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)), [`R`](https://en.wikipedia.org/wiki/R_(programming_language)), [`MATLAB`](https://en.wikipedia.org/wiki/MATLAB), [`Julia`](https://julialang.org/)) often do not require type declaration and do not involve a pre-compilation step. Instead, the code is **interpreted** at run-time using an special program called [**interpreter**](https://en.wikipedia.org/wiki/Interpreter_(computing)). One could write the previous [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) code in [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) as
```python
age1 = 10
age2 = 20
def diff(num1,num2): return num1-num2
diff(age2,age1)
```
These languages are more expressive, drastically increasing the productivity of developers. The price to pay is a (in many cases unacceptable) performance hit that can easily be of the order of hundreds.

In this unit, we will focus on dynamic languages, since the performance hit is not an issue, in general, in undergraduate scientific projects and some scientific tasks. In any case, one can combine the productivity of dynamic languages with the performance of static languages by using pre-compiled external libraries (written in [`C`](https://en.wikipedia.org/wiki/C_(programming_language)), [`C++`](https://en.wikipedia.org/wiki/C%2B%2B), or [`Fortran`](https://en.wikipedia.org/wiki/Fortran)) for the computationally intensive kernels. One ubiquitous approach is to combine [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) code with the [`C`](https://en.wikipedia.org/wiki/C_(programming_language)) library [NumPy](https://numpy.org/) for array computations. In order for this approach to work, [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) code must involve vectorisation, e.g., operations are applied to whole arrays instead of individual entries.

The static vs. dynamic paradigms, code productivity and performance are serious issues to be considered when creating scientific software projects. There is no *the best* alternative, since it is very case-dependent. Analogously, it is hard to decide which is *the best* static or dynamic programming language, since it depends on the type of work to be performed. In fact, new programming languages are still being created nowadays to solve the drawbacks of existing approaches. [`Julia`](https://julialang.org/) deserves special mention in the frame of scientific coding. It is a dynamic language originated in 2011 at MIT that does not suffer the performance hit.


## 1.2. The four elective modules
<a id="markdown-the-four-elective-modules" name="the-four-elective-modules"></a>

For all these reasons, SCI1022 includes four different workshops on three dynamically-typed languages, namely, [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)), [`MATLAB`](https://en.wikipedia.org/wiki/MATLAB), [`R`](https://en.wikipedia.org/wiki/R_(programming_language)), and an untyped language, [`Mathematica`](https://en.wikipedia.org/wiki/Wolfram_Mathematica). Below, we provide a description of the four different languages that would help students to pick the ones that better fit their requirements. You can do your own research, in order to decide which is the right language for you. There are also different indices that measure the _popularity_ of programming languages, e.g., the [TIOBE index](https://en.wikipedia.org/wiki/TIOBE_index). You can find the ranking [here](https://tiobe.com/tiobe-index/).

Below is a very short description of the four languages being offered. More detailed information can be found in the respective Moodle pages.

### 1.2.1. `Python`
<a id="markdown-python" name="python"></a>

[`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is the most popular languages for scientific coding, especially for data science. It is widely used both in academia and industry because of its simplicity and flexibility. [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is an object-oriented language, and probably the best one for learning this programming paradigm. Python is general purpose and can be used in any scientific discipline, from computational mathematics and physics to data science. [`Python`](https://en.wikipedia.org/wiki/Python_(programming_language)) is a community-driven open source project, with thousands of freely available packages in almost any discipline.

### 1.2.2. `MATLAB`
<a id="markdown-matlab" name="matlab"></a>

[`MATLAB`](https://en.wikipedia.org/wiki/MATLAB) is a commercial numerical computing environment that is easy to learn and use. It is very popular at undergraduate university programmes, especially in mathematics and some engineering disciplines, and used in some research areas. The basic package comes with linear algebra, data processing and plotting tools. Extra functionality is provided by Mathworks through toolkits. Monash has a `MATLAB` site-license that allows Monash students to install it on their personal computers.

### 1.2.3. `R`
<a id="markdown-r" name="r"></a>

[`R`](https://en.wikipedia.org/wiki/R_(programming_language)) is an open source language and environment for statistical computing and graphics. [`R`](https://en.wikipedia.org/wiki/R_(programming_language)) provides a wide variety of statistical and graphical techniques, and is highly extensible. It is widely used in data science and applications, e.g., in biology or chemistry. In the field of data science, one can find a freely available package for almost anything.

### 1.2.4. `Mathematica`
<a id="markdown-mathematica" name="mathematica"></a>

`Wolfram Mathematica` is a proprietary program which is particularly well-suited for symbolic computations. It is an untyped language. It can be of interest for undergraduate students in mathematics and physics that require to make intensive use of symbolic computation. [`Mathematica`](https://en.wikipedia.org/wiki/Wolfram_Mathematica). Monash has a `Mathematica` site-license that allows Monash students to install it on their personal computers.
