# Assignment Unix shell and Git intro

Submit in the SCI1022 Moodle page a file in which you gather the answers to the questions formulated below (more details can be found in the following sections).

## Assignment instructions/recommendations

Complete the tasks in the "Assignment statement" section below **in sequence**. The answers must be written down in a text file named  "`<surname>_sci1022_assignment_answer.txt`", where `<username>` is your surname. You must take the following instructions into consideration:

* You have to write down the commands that you executed to solve the task, as well as the output that you got printed on screen for each of the different commands. 

We recommend a workflow based on two terminal windows. In the first terminal window you can edit your answers using `nano`. The second one can be used to execute the commands required to complete the different tasks.

## Assignment statement

1. Download the Tragedie of Hamlet by William Shakespeare eBook in text format (via command-line). In particular, the eBook is available at the following URL: 
    > http://www.gutenberg.org/cache/epub/2265/pg2265.txt 
 
   The file must be located at `~/ebooks`, and be named as `hamlet.txt`.

2. Change the current working directory to `/usr/lib`. Write two different commands in order to output on screen the size in bytes and the permissions of `hamlet.txt`. The first command must use an absolute path, while the second a relative one (with respect to the current working directory, i.e.,  `/usr/lib`). *Hint 1:* Use the `ls` command with an appropriate flag. *Hint 2:* run `pwd` with the current working directory located at your home directory in order to grasp the structure of its absolute path.

3. Print the number of lines, words and bytes in `hamlet.txt` on screen. Check that the latter figure matches the one that you obtained in task #2.

4.  Write **a single-line** command that outputs line #3447 of `hamlet.txt`. *Hint:* use `head`, `tail`, command pipelining, and the appropriate flags.

5. Count the number of lines in which the substring "hamlet" appears at `hamlet.txt`. Use case-insensitive matching. *Hint:* use `grep`, `wc`, command pipelining, and the appropriate flags.
  
> **Note**: If you decide to use relative paths in your answers, do not assume a (previous) current working directory, but also write down the command that is required to change to the current working directory your paths are relative to. For example, if you had to touch a file named `file.txt`,  located at your home directory, as your first task, then you could either write `touch ~/file.txt` (absolute path) or `touch file.txt` (relative path). The latter command is **only correct** if the current working directory is `~`. 
Therefore, do not assume in your answer that the current working directory is `~`. Instead, the correct answer to that hypothetical task would be:
> ```
>   $ cd ~ 
>   $ touch file.txt
> ```
> even if the home folder is typically the current working directory when you just open a new terminal session.
