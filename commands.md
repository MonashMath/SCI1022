This tutorial provides an introduction to the Unix command-line. I have created a set of videos, but I also recommend you to read the material we have created.

The term Unix is used to refer to a family of different (but related) Operating System (OS) software. 

An OS is a layer of software between the user and the computer hardware. It manages files, screen output, keyboard input, and makes sure that multiple users and their programs can coexist without clashes in a single system, among other things.

Linux and Mac are variants of Unix systems. You can follow the tutorial on terminals in both operating systems. We will learn the so called bash shell

Nowadays, we are too used to graphical user interfaces  (GUIs), like the windows that you open and the boxes you click with your mouse. 

It was not like this years ago. 

Before, the only way for the user to interact with the computer was through a **Command-Line Interface** (CLI). In such an interface, the user types *commands* that tell the computer what to do. This interface is the terminal, or shell.

So, why to teach this in 2021?

The main reason is that the shell is all you will have when you interact with your Department cluster or an Australian supercomputers. Since you are science students, and as I explained the first week, computational science is almost everywhere, you will likely need to run your molecular dynamics, data analysis, or numerical PDE algorithms on a cluster with enough computational resources.

So, let us start opening a terminal in Linux or Mac, or open a terminal in Anaconda if you have a windows machine. Here, we learn the commands of the most common Unix shell, bash.

%%%

You can click on the terminal icon at the Ubuntu Dock, i.e., the bar on the left-hand side of the screen.

What on macOS, a terminal window can be found by typing "terminal" in the [Spotlight Search bar](https://support.apple.com/en-us/HT204014),

What on Windows Anaconda?

%%% ECHO

Now, let us start learning commands. 

These are like the words in a language, that you need to memorize (or just come here to remember).

Let us start with one that simply prints a message (set of characters) on screen. The place where this message is printed is called "standard output". By default, commands are set up such that the standard output is connected to the user's screen, but it is possible to modify such behaviour in order to redirect messages, e.g., to a file. 

$ echo hi!

The argument of the `echo` command can be wrapped around single or double quotation marks, with the output being equivalent as without quotation marks:

$ echo byebye
$ echo "byebye" 
$ echo 'byebye'  

However, if the string to be printed has spaces in it, putting or not putting quotation marks makes a big difference

$ echo bye    bye
$ echo "bye    bye"

In the first case, we are actually passing two arguments to `echo`, then `echo` concatenates all the arguments in a single string, separating them by spaces. 

In the second case, we are passing just a single argument with a bunch of spaces in the middle.

A frequently undesired effect arises when one uses quotation marks and presses the Return key without closing the quotation mark:

$ echo 'bye bye

At this point, we seem to be stuck. 

The solution is as simple as typing the closing quotation mark and then pressing the Return key

Some times the problem will be harder to solve... So, we need to know how to abort a command.

This strategy is called "`Ctrl-C`", which stands for "**While holding pressed** the `Ctrl` keyboard key, press the keyboard key labelled `C`".  Please note that `C` does not actually refer to capital letter C, but to the key labelled `C`, so that you should not press the key labelled as `Shift` in between `Ctrl` and `C` keys. 

%%% MAN

The shell includes a very useful command to get comprehensive information about other commands. The name of this command is man for manual. But it is not at your disposal if you are using the git-shell provided by `Miniconda`.

$ man echo

A much shorter version can be obtained with --help, and it works in Miniconda too

$ cat --help

echo is an exception, you need to write echo help for obvious reasons

STOP Exercise 2

------
> *__Exercise 2:__* Go over the man page or help of the `echo` command, and identify the option that let you avoid printing the newline character at the end of the string received as the argument to `echo`. Print the "hello, world" message, with and without the option.  Is the difference among these two as expected? Note that the position of the option matters. What happens if you put the option at the end? Why?
------

$ help echo
$ echo -n "hello, world"
$ echo "hello, world" -n

%%% Editing the line

The shell (recall that we are using the `bash` shell) provides several features that let you become more efficient at command-line typing. 

Hitting the up arrow key, one can retrieve the previous command. 

Pressing it multiple times, we can navigate up through the history of commands used so far. 

Down arrow key, we navigate the history the other way towards the latest introduced command. 

> *__Exercise 4:__* Use the up arrow in order to print the messages “cold”, “cord”, “word”,  “ward”, "hard" without retyping `echo` each time.

%%% Clearing screen

The `clear` command can be used in order to clean up the output

A key combination with the same result as `clear` is `Ctrl+L`. 

On the other hand, when you want to end the current session, you can use the `exit` command or the `Ctrl+D` key combination.

%%% Unix File system

In this tutorial we will learn basic commands for manipulating **files** (create, display, edit, remove, etc.) and **directories** (create, list, rename, navigate, etc.). 

Files and directories are the basic building blocks of the **Unix file system**. 

The Unix file system is a tree-like structure with its base at the so-called root directory, which is referred to by the forward slash character `/`. 

%%% Output redirection to create a file

One of the simplest ways of creating a new file is by using a feature of the shell known as output redirection.

Lets one connect the standard output of a command with an output file.

The shell uses the symbol `>` (greater than) to denote output redirection.
$ echo "Arrived compass prepare an on as." > sentences.txt

You can avoid typing the sentence yourself by copying it from the web browser, and then pasting it into the terminal. In order to do so, once you have copied the sentence, you have to use `Ctrl+Shift+C` and `Ctrl+Shift+V` to paste it in the terminal (for macOS and Linux) or just `Ctrl+C`and `Ctrl+V` in the `Miniconda` `git-shell` for Windows users. 

Inspect the contents of the new file using the `cat` command 

$ cat sentences.txt 

Now want to add the second sentence of [Figure 12](#fig_random_text) into `sentences.txt`. You can do this by using a feature known as output appending, i.e., the message to be printed is appended to an existing file starting from the end. Output appending is referred to by means of the `>>` operator.

$ echo "Reasonable particular on my it in sympathize." >> sentences.txt

$ cat sentences.txt # Use the arrow

%%% Input redirection

Many commands that print to standard output (e.g., `cat`, or `echo`) get the information to be printed from the so-called **standard input** when they are called **without arguments**.

By default, the standard input is connected to the keyboard of your machine.

$ cat


`cat` enters in a state in which it is expecting that you introduce the contents of the file to be printed from the keyboard. It in particular prints to the standard output the whole text introduced so far each time that you press the Return key. 

Once you have finished writing, you can hit `^D` 

**Input redirection** is a feature of the shell that lets you unplug the standard input of a command from the keyboard, and plug it into a file. 

In other words, the contents that the command would expect from the keyboard are read from the contents of a file instead. 

$ cat < sentences.txt

STOP Exercise 7

$ echo "Arrived compass prepare an on as." > sentences.txt
$ echo "Reasonable particular on my it in sympathize." >> sentences.txt

$ echo "Arrived compass prepare an on as." >> sentence_1.txt
$ echo "Reasonable particular on my it in sympathize." >> sentence_2.txt

$ cat sentences.txt > sentences_backup.txt

$ diff --help

$ diff sentences.txt sentences_backup.txt

$ cat sentence_2.txt sentence_1.txt > sentences_reversed.txt

% Listing files

The `ls` command lists all files and (sub)directories in the current directory, excluding those which are **hidden** files;

$ ls

The `ls` command can be used to check if a file (or directory) exists: 

$ ls sentence_3.txt

One useful feature of the shell is its support for the *wildcard character* `*`.

$ ls sentence

STOP Exercise 8:

$ echo *.txt

There are several particularly useful flags of `ls`. First, the option `-l` activates the "long form" of `ls`:

$ ls -l

`ls` variant is `ls -t -l`, which lists the long form of each file or directory ordered by modification date, above the newest and at the bottom the oldest. `ls -r -t -l` do the same in reverse order.

$ ls -rtl

# Hidden files

 Hidden files are characterized by their name starting with a dot `.`, 

are commonly used for things like storing user preferences and low-level configuration files

we need to pass `ls` the `-a` flag.

# Copying, renaming, and deleting files

The `cp` command can be used to copy a file.

STOP Exercise 11

$ cp sentence_1.txt sentence_1_new.txt
$ diff sentence_1.txt sentence_1_new.txt
$ echo sentence_1_nex.txt << "Now this last comment"
$ diff sentence_1.txt sentence_1_new.txt

You can rename files with `mv` (from move). This name comes from the fact that the command is used, in the most general case, to move one file from a source to a target directory, possibly changing its name at the target directory. In the degenerated case in which the source and target directory are equivalent, then the command falls back to file renaming.

STOP Exercise 12

$ mv sentences.txt first_two_sentences.txt

Now the DANGER ZONE

files are deleted with `rm`. **Be careful!:** this command is highly dangerous, there is **NO UNDO**. NEVER TRY `rm -rf /` and close friends. It would delete everything!!!

$ rm first_two_sentences.txt

# Directories

The root of the tree is indicated with a forward slash character, `/`.

Any directory or file of the system can be uniquely identified by an *absolute path*.

An absolute path is the full path from the root of the tree to the particular directory or file at hand, where the name of each directory in this path is separated using the forward slash character `/`.