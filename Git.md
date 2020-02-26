<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
<!-- TOC -->

- [1. Introduction to Version control](https://en.wikipedia.org/wiki/Versioncontrol) using [Git (2h 40min).](#1-introduction-to-version-controlhttpsenwikipediaorgwikiversioncontrol-using-git-2h-40min)
    - [1.1. Version Control in a nutshell](#11-version-control-in-a-nutshell)
    - [1.2. Why Git?](#12-why-git)
    - [1.3. Accessing Git and our first Git command](#13-accessing-git-and-our-first-git-command)
    - [1.4. Initial configuration options](#14-initial-configuration-options)
    - [1.5. Creating a **local** Git repository](#15-creating-a-local-git-repository)
    - [1.6. The concept of staging area. Creating our first commit](#16-the-concept-of-staging-area-creating-our-first-commit)
    - [1.7. Modifying an already tracked file. Viewing the diff](#17-modifying-an-already-tracked-file-viewing-the-diff)
    - [1.8. Backing up and shipping the local repository on GitHub](#18-backing-up-and-shipping-the-local-repository-on-github)
        - [1.8.1. Creating an account on GitHub](#181-creating-an-account-on-github)
        - [1.8.2. Connecting to GitHub with SSH keys](#182-connecting-to-github-with-ssh-keys)
        - [1.8.3. Creating a new GitHub project (and associated Git repository)](#183-creating-a-new-github-project-and-associated-git-repository)
        - [1.8.4. Pushing into the remote Git repository at GitHub](#184-pushing-into-the-remote-git-repository-at-github)

<!-- /TOC -->

# 1. Introduction to [Version control](https://en.wikipedia.org/wiki/Version_control) using [Git](https://git-scm.com/) (2h 40min).
<a id="markdown-introduction-to-version-controlhttpsenwikipediaorgwikiversioncontrol-using-git-2h-40min" name="introduction-to-version-controlhttpsenwikipediaorgwikiversioncontrol-using-git-2h-40min"></a>

This tutorial provides an introduction to Version Control using a particular software tool called [Git](https://en.wikipedia.org/wiki/Git). 
Git belongs to a **crucial class** of tools in the scientific coding workflow referred to as [Version Control Systems](https://en.wikipedia.org/wiki/Version_control) (VCSs). The starting point of the tutorial is such that you do not have to know what VCSs and, in particular, Git are (or even have ever heard about them!). All you need is some basic familiarity with the Unix command-line, as Git comes in the form of a Unix-like command. Recall that in the [previous tutorial](Unix-CLI.md) we introduced you to the Unix command-line. Fortunately, this introduction is more than you need to start using Git from the command-line.
While there are [some great GUI-based tools](https://git-scm.com/downloads/guis/) that can be used on top of Git, it is more convenient to learn Git using git-specific commands first and then to try out a GUI-based solution once you are more comfortable with the command.

In this tutorial we do not pursue nor pretend to be too comprehensive. The advanced features of Git are tricky to learn, and are based to a large extent on theory concepts that are hard to grasp and thus pretty too much for an introductory tutorial. Instead, we will cover the very minimal set of features and associated commands that let you start becoming productive with such a sophisticated tool. Right at the end of the tutorial, we will point you to a set of further references that you can use to expand your Git skills much further.

## 1.1. Version Control in a nutshell
<a id="markdown-version-control-in-a-nutshell" name="version-control-in-a-nutshell"></a>

A VCS is an special program that provides an **automatic and effective** way to track changes in your project files and directories. It allows you to effectively “save your work" (referred to as *"commit your work"* in VCS parlance) at selected points in the development timeline, and to view/retrieve the files and directories in the status corresponding to any of these save points in the past as desired.  VCSs provide a definitive automated solution to the still (surprisingly) widely-used **bad practice** of manual tracking of changes based on cumbersome file naming conventions. This is better illustrated graphically with the "notFinal.doc" comic by Jorge Cham available [here](http://phdcomics.com/comics/archive.php?comicid=1531). It is clearly not practical to have multiple nearly-identical versions of the same document with such cumbersome file names. Nowadays, applications like
[Microsoft Word](https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a), [Google Docs](https://support.google.com/docs/answer/190843?hl=en), or [LibreOffice](https://help.libreoffice.org/Common/Recording_and_Displaying_Changes) do offer built-in version tracking, but such features are tightly coupled to the underlying application and are not useful for any other document types.

Beyond the aforementioned, modern VCSs allow you to **develop disruptive, speculative features** without affecting the main development trunk. Besides, with a VCS, you can keep **remote, offsite backups** of your project files and history, e.g., using a repository hosting service in the Cloud such as [GitHub](https://github.com/). You may likely find someone (or even you did experience it yourself) that has **lost work**, e.g., by accidentally removing it, due to corrupted hard-drives, etc. Although it is still possible to loose data using a VCS, the probability and amount of data loss are minimized if one keeps a systematic and appropriate workflow while using the tool. Last but not least, a VCS lets you **collaborate easily and conveniently** with others, and to **ship your product**, i.e., to expose your work to the **public domain**. However, teams are not the only ones to benefit from version control. If you are working alone in your project, say a class assignment, you can benefit immensely as well. 
Keeping track of what was changed, when, and why, is extremely helpful if you interrupt the project development and have to come to it later on, when most probably your memory has become fuzzy and likely to fail.  

VCSs have evolved considerably over the years, and still nowadays, there are a number of alternatives to [Git](https://git-scm.com/). [Wikipedia](https://en.wikipedia.org/wiki/Template:Version_control_software) provides a pretty comprehensive picture of the (overwhelming) variety of past and present VCSs.  The family line leading to Git includes [RCS](https://en.wikipedia.org/wiki/Revision_Control_System), [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System), and [SVN](https://en.wikipedia.org/wiki/Apache_Subversion), although there are timely alternatives to Git as well, such as, e.g., [Mercurial](https://en.wikipedia.org/wiki/Mercurial), or [Bazaar](https://en.wikipedia.org/wiki/GNU_Bazaar), to name a few. In contrast to RCS, CVS, SVN, which are considered nowadays outdated technology, modern VCSs, such as Git or Mercurial, are [**distributed VCSs**](https://git-scm.com/about/distributed), meaning that they do not need a centralized server to host the repository. **Every local copy of a remote repository (referred to as a "clone" in the Git parlance) is a fully working copy.** In case there is a problem with the computer originally hosting the remote repository (e.g., it becomes corrupted or lost), any local copy can recreate the full history. On the contrary, in a centralized VCS, there is a unique server that contains all changes in the project and the local copies are just light versions it. If the server goes down, you lose all the history. 


## 1.2. Why Git?
<a id="markdown-why-git" name="why-git"></a>

There are a number of reasons ([some of them quite technical](https://git-scm.com/about) to be enterely grasped at this point), but the most important are perhaps the following ones. Git achieves **a sound balance** among speed, efficiency, reliability, and ease-of-use. Indeed, this hallmark of Git has positioned it to be undoubtedly the de-facto standard VCS  used in ([open source](https://opensource.com/resources/what-open-source)) scientific (and not necessarily scientific) software projects. Git was originally developed in 2005 by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), the same individual who created the Linux OS, i.e., an open source variant of Unix.  Therefore, it is also (as could not be otherwise) **[free and open source](https://git-scm.com/about/free-and-open-source)**. Since then, its popularity has increased significantly, mostly due to the development of repository hosting services in the Cloud such as  [Github](https://github.com/), [Gitlab](https://about.gitlab.com/), or [BitBucket](https://en.wikipedia.org/wiki/Bitbucket). Indeed, **virtually the whole state-of-the-art in open source (scientific and not necessarily scientific) software is available at these Git repository hosting services**. Finally, it is worth mentioning that Git is available on multiple platforms, including Microsoft Windows, Linux, or macOS, among others.

Git is what professionals use to keep track of what they have done and to collaborate with other people. Large software development projects rely on it, and most programmers use it for their small jobs as well. And it is not just for software: books, papers, reports, small data sets, and anything that changes over time and/or needs to be shared **should be** stored in a Git repository. Indeed, we used Git in order to track the different versions of this tutorial.

## 1.3. Accessing Git and our first Git command
<a id="markdown-accessing-git-and-our-first-git-command" name="accessing-git-and-our-first-git-command"></a>

In this tutorial we will use the Git version that is already installed along with [Cygwin](https://www.cygwin.com/) at [MoVE](https://www.monash.edu/learning-teaching/innovation/educational-technologies/move), so that we do not assume any installation prerequisite on your Laptop or Desktop. 
See instructions [available here](./Unix-CLI.md#112-running-a-terminal) in order to launch a Cygwin terminal. In any case, if you wish to install Git on your system, you can follow the instructions available [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). 

All Git commands are of the form `git command [arguments]`, where `command` is the git command to be executed, i.e., what we actually want to do, and `arguments` is an (optional) list of arguments which may be needed for the particular `command` at hand. That said, let us type our first command. In particular, `git help`, which by itself is quite helpful as it gives general guidelines on Git usage:

```bash
$ git help
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
```

Besides, when `git help` is applied to a specific command, it gives further information on that
command. For example, `git help add` shows details regarding the `git add` command (check it!). The output of `git help` very much resembles [man pages](./Unix-CLI.md#typing-our-first-commands-looking-for-help-using-man), so that it can sometimes be rather cryptic and hard to understand for non-advanced Git users. Therefore, it you struggle to understand the help messages shown by `git help`, do not panic, they are an excellent opportunity to develop your computer skills.


## 1.4. Initial configuration options
<a id="markdown-initial-configuration-options" name="initial-configuration-options"></a>

When we use Git on a new computer for the first time, we need to set up a few one-time initial configuration options. The very minimal one-time options to be set up to start using Git are: our name, our email address, and our preferred comand-line text editor. This is achieved by means of the following three Git commands, respectively:

```
$ git config --global user.name "Given name(s) Family name"
$ git config --global user.email "myname@monash.edu"
$ git config --global core.editor "nano"
````

where you have to replace "`Given name(s) Family name`" by your own names, and `"myname@monash.edu"` by your actual Monash e-mail address. The values provided to the `user.name` and `user.email` options are used by Git in order to identify the changes that you perform on the repository files by your name and e-mail address. Indeed, as we will see in [Section XXX](), each time that you save a set of changes, i.e., each time that you create a new "commit", your name and e-mail address will be associated to these changes. This becomes especially helpful when you are collaborating with others. Later on in this tutorial, we will be interacting with GitHub. Therefore, **the email address provided should ideally be the same as we will use later in order to set up your GitHub account, e.g., your Monash e-mail address**. We note that the provided names and e-mail address will be viewable in any projects that you ship to the public, e.g., in GitHub, so please do not accidentally expose any information that you would rather like to keep private.
On the other hand, the value provided to the `core.editor` tells Git which command-line editor to be used. In particular, the editor is called by Git whenever it requires that you associate a message to a newly created commit; see [Section XXX](). In the command above, we are telling Git to use the GNU `nano` editor, which we covered in the [previous tutorial](./Unix-CLI.md#brief-introduction-to-the-gnu-nano-command-line-text-editor). Finally, it is important to mention that the three commands we just ran only need to be run once: the flag `--global` tells Git to use the settings for every project, in your user account, on this computer. You can change your configuration as many times as you want: use the same commands to choose another editor or update your email address.

> *__Note:__* As mentioned in the [previous tutorial](./Unix-CLI.md#directory-structure), the contents of the home directory might vary among different Cygwin terminal sessions, e.g., when you close a terminal and open a new one. In the particular case of Git, the consequence of this behaviour is that the Git options that we have set during a terminal session might not be available for a different session. In order to check whether the configuration we are interested in is in effect in the current session, we can type `git config --list --show-origin`. If the output of this command does not show the `user.name`, `user.email`, and `core.editor` options and their associated values, then **we have to run the three commands above again such that they become active in the current session**.

## 1.5. Creating a **local** Git repository
<a id="markdown-creating-a-local-git-repository" name="creating-a-local-git-repository"></a>

Let us start a new project and put it under version control with Git.
We will just create a single `README.md` file written in the [*Markdown language*](https://en.wikipedia.org/wiki/Markdown). Markdown is used by GitHub as a very simple way to format text on the web. We will only use the very basic features of Markdown, such as formatting words as bold or italic, adding images, and creating lists. The 3-minute tutorial available [here](https://guides.github.com/features/mastering-markdown/) is helpful in order to get started Github Markdown.

We start by creating an empty directory with the generic name `myproject`, but please note that, in a real case scenario, it is best to give the directory an intention revealing name. We will create the directory within the `~/Documents` folder:

```bash
$ cd ~/Documents/
$ mkdir myproject
```

> *__Note:__* Recall that, because of reasons made clear in the [previous tutorial](./Unix-CLI.md#directory-structure), if you want the files and directories to be consistent among Cygwin terminal sessions, you have to place them at the `~/Documents/` folder.

Although the `myproject` directory is void, it can be already converted to a **Git repository**, which you may conceive as a sort of enhanced folder able to track changes made within the folder. The Git command in charge of making the *current working directory* (i.e., `~/Documents/myproject`) a new repository is ` git init`:

```bash
$ cd myproject/
$ git init
Initialized empty Git repository in /home/amar0078/Documents/myproject/.
```
This command creates a special hidden directory where Git stores the project history, i.e., the information it needs to track changes performed on the project files and directories.


----
> *__Exercise 1:__*
Determine the name of the *hidden* directory that Git creates right after calling `git init`, and list its contents on screen.
----

## 1.6. The concept of staging area. Creating our first commit
<a id="markdown-the-concept-of-staging-area-creating-our-first-commit" name="the-concept-of-staging-area-creating-our-first-commit"></a>

Git does not actually allow to complete the creation of a Git repository while it is void, so we need to make a change to the current directory and **explicitly register it**, i.e., to create our first commit. To this end, we will use the GNU `nano` editor to create a new `README.md` file, with the following contents:

```bash
$ nano README.md # Use nano here to add the contents to README.md shown below 
$ cat README.md
This is an example README.md file
```

Right after creating this first file, we can use the `git status` command to see the result:

```bash
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        README.md

nothing added to commit but untracked files present (use "git add" to track)
```
The “untracked files” message means that there is a file in the `myproject` directory that is not under the control of Git, i.e., that is not being tracked by Git.  At this point is when the concept of **staging area** (also referred to as **index**) enters the scene. One of the most confusing parts when you are starting with Git is this concept of staging area and how it relates to a commit. **A commit is a record of what files you have changed since the last time you made a commit, and the changes that you performed in these files.** Essentially, you make changes to your repository (e.g., adding a file or modifying an existing one) and then tell Git to register those changes into a commit. Commits make up the essence of your project and allow you to go back to the state of a project at any point in the timeline. Therefore, how do we tell Git which changes to put into a commit? 

To add a new file to a commit, and/or the changes made to a file already being tracked by Git, **you first need to add them to the staging environment**. To this end, you can use the `git add filename` command.
Once you have "prepared your commit", i.e., once you have used the `git add` command to add all changes to the staging environment, you can then tell Git to package them into a commit using `git commit`. Therefore, in our particular scenario, we have to add the new file to the staging area: 

```bash
$ git add README.md
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   README.md
```

As indicated by the message, the status of the `README.md` has been promoted from untracked to staged. (Note also the "Changes to be committed" message.) Then, we create a new commit, that will include the new file:

```bash
git commit -m "First commit of myproject with a preliminary version of a README.md file"
[master (root-commit) 057083a] First commit of myproject with a preliminary version of a README.md file
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
```

The message associated to the commit (i.e., the string of characters passed as an argument to the `-m` flag) should be ideally intention revealing, i.e., something that accurately describes what the commit contains, e.g., a new feature, a bug fix, or just fixing a typo. Do not use messages like "AAAAA" or "adfjdkfjdkfj". (The reference available [here](https://medium.com/better-programming/stop-writing-bad-commit-messages-8df79517177d) provides some tips on how commit messages should be written.)

If we now run `git status`:

```bash
$ git status
On branch master
nothing to commit, working directory clean
```

the output reflects that there are no new files nor changes in existing files that can be potentially staged. At this point, we can ask Git to print on screen the project's history using `git log`:
```
$ git log
commit 057083ac5d9e2718626854c90b2ba6226e6f57f2 (HEAD -> master)
Author: My name <myname@monash.edu>
Date:   Mon Feb 24 21:28:03 2020 +1100

    First commit of myproject with a preliminary version of a README.md file
```
that lists all commits made to a repository in reverse chronological order. The list for each commit includes the commit's hash (to be introduced in the sequel), commit’s author, when it was created, and the log message Git was given when the commit was created, i.e., the string provided above to the `-m` flag. The commit's hash is an automatically generated sequence of letters and numbers that Git uses in order to 
to **uniquely** identify each commit. In the example above, the hash is  
`057083ac5d9e2718626854c90b2ba6226e6f57f2`, but your result will differ since **each commit has a unique hash**. Some advanced Git commands require that you explicitly refer to a commit using the commit's hash as an argument. We will put the commit hash in action in the next section.

----
> *__Exercise 2:__*
> * Create a pair of new files called `file1.txt` and `file2.txt` within the repository directory with whatever method and contents you like.
> * Add `file1.txt` to staging area. Confirm that you suceeded using `git  status`.
> * Commit `file1.txt` using `git commit -m` and an appropriate message.
> * Add `file2.txt` to staging area. Confirm that you suceeded using `git  status`.
> * Now run `git commit` **without the `-m` option**. A GNU nano editor will be run in order to let you edit the commit's message. Use your `nano` skills to add an appropiate message, save, and quit.
> * Use `git log` to confirm that you suceeded creating the previous two commits.
----

## 1.7. Modifying an already tracked file. Viewing the diff
<a id="markdown-modifying-an-already-tracked-file-viewing-the-diff" name="modifying-an-already-tracked-file-viewing-the-diff"></a>

So far we have created 3 commits on our **local** repository. Each of these three commits added a single **new** file, i.e., `README.md`, `file1.txt`, and `file2.txt`, respectively. However, we also want to modify the contents of files which are already tracked by Git. When we do that, it is often very useful to be able to see the changes that we have performed on a file (set of files) before adding them to the staging area, i.e., before preparing Git for a new commit. To see how does it work, let's put the word "example" in the `README.md` file in boldface using Markdown as follows (note that we just added `**` before and after the word "example"):

```bash
$ nano README.md # Use nano to modify the contents of README.md as shown below 
$ cat README.md
This is an **example** README.md file
$ git status
On branch master

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

The `git diff` command, **by default** (i.e., when called without additional arguments), shows **the difference between the staged version of a file and the version of the file with those changes that are yet unstaged**. As we did not yet add any change to the staging area, the staged version of the file and the version corresponding the last commit are equivalent. Thus, `git diff` shows the differences among the unstaged version of the file and the version of the file corresponding the last commit: 

```bash
$ git diff
diff --git a/README.md b/README.md
index 7dc68e2..46c3e91 100644
--- a/README.md
+++ b/README.md
@@ -1 +1 @@
-This is an example README.md file
+This is an **example** README.md file
```

In our case, we only modified a single file, i.e., `README.md`, such that the we changed the previous contents of its first line ("`@@ -1 +1 @@`"), i.e., "`-This is an example README.md file`", by "`+This is an **example** README.md file`". Let us now add these changes to the staging area: 
```bash
$ git add README.md
$ git diff
$ 
```

**We can see that now the output `git diff` is empty**. This is because there is no difference among the unstaged version of `README.md` and the staged version of it. To be more precise, there are actually no unstaged changes pending to be added to the staging area. To see the difference among the staged changes and the previous version of the repository, i.e., the previous commit, we can use the following command:

```bash
$ git diff --staged
diff --git a/README.md b/README.md
index 7dc68e2..46c3e91 100644
--- a/README.md
+++ b/README.md
@@ -1 +1 @@
-This is an example README.md file
+This is an **example** README.md file
```

Let us now add a new line to `README.md` **before commiting**:

```bash
$ nano README.md # Use nano to add a new line to README.md as shown below
$ cat README.md
This is an **example** README.md file
We are writing it while following the second workshop of SCI1022
$ 
```

If we invoke `git status`, we get the following:
```
amar0078@MVAZ1STUL01006 ~/Documents/repository4sci1022$ git status
On branch master

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md
```

that is, there are actually two different of sets of changes into `README.md` with respect to the last commit. On the one hand, we have the changes that have been already staged (recall that we put "example" in bold face, and that we stagged that change), and the ones that are not staged (recall that we have added a new line to the file and that we did not staged it).

----
> *__Exercise 3:__*
> Recall that `git diff` returns by default the difference between the staged version of a file and the version of the file with those changes that are yet unstaged. According to this, can you advance what will `git diff` output in the current scenario? Why? Run `git diff` and check whether your conclusion matches the actual result. Repeat the same exercise with `git diff --staged`.
>
> *__Exercise 4:__*
> If we run `git diff commit_hash`, where `commit_hash` is the hash of a commit in the past, then Git reports the differences among the version of the file corresponding to the commit with commit hash `commit_hash` and the version of the file that includes both unstaged and staged changes. 
Retrieve the commit's hash of the unique commit that we performed so far using `git log`, and use `git diff commit_hash` to confirm that behaviour of this latter command.
----

At this point we are faced with two options (that are indeed pointed out by the very helfpul output of `git status`). We can either discard unstaged changes, or add them to the staging area. We will opt for the first option. In order to do so, we have to use the `git checkout` Git command as follows:

```bash 
$ git checkout -- README.md
$ git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md

amar0078@MVAZ1STUL01006 ~/Documents/repository4sci1022$ cat README.md
This is an **example** README.md file
```

Note that, after using `git checkout`, there are no unstaged changes anymore, i.e., the second line that we added to `README.md` is no longer there. We finish this section by creating a new commit included the only change that we finally included in the staging area, i.e., to put "example" in bold face:

```bash
$ git commit # As always, use nano to write an intention revealing message
$
```

## 1.8. Backing up and shipping the local repository on GitHub
<a id="markdown-backing-up-and-shipping-the-local-repository-on-github" name="backing-up-and-shipping-the-local-repository-on-github"></a>


In this section we are going to back up your local repository on GitHub and ship it to the public, i.e., anyone with an Internet connection is going to be able to access to its contents (and the project's history). Recall that one of the hallmarks of Git is that it allows shipping your work to others, and work collaboratively with them. While shipping means exposing your work (also to those which are going to be critic with it), it is the first step towards finding collaborators. 

### 1.8.1. Creating an account on GitHub
<a id="markdown-creating-an-account-on-github" name="creating-an-account-on-github"></a>

If you do not have already a GitHub account linked to your Monash e-mail, please open a new one by visiting the [GitHub signup page](https://github.com/join). Use preferably the same e-mail address that you previously used in [Section XXX](), e.g., your Monash e-mail address. This is not actually mandatory, but highly recommended, as this set up will allow GitHub to link your Git activity (e.g., commits) to your GitHub user.

### 1.8.2. Connecting to GitHub with SSH keys
<a id="markdown-connecting-to-github-with-ssh-keys" name="connecting-to-github-with-ssh-keys"></a>

Once you have signed up for GitHub, you have to generate a [public/private pair](https://en.wikipedia.org/wiki/Public-key_cryptography) of [SSH](https://en.wikipedia.org/wiki/Secure_Shell) keys, and then, to link the public SSH key  just generated with your account. In a nutshell, a public/private SSH key pair lets you authenticate against GitHub without having to introduce your GitHub's account password each time that you need to interact with GitHub from the command-line. To this end, we have to execute the following command and follow the instructions (essentially press the Return key twice):

```bash
$ ssh-keygen -t rsa -b 4096 -C "myname@monash.edu"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/amar0078/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Your identification has been saved in /home/amar0078/.ssh/id_rsa.
Your public key has been saved in /home/amar0078/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:Y+JdoPfWm/AJIc1oQnkvWVhwVPiT3M75f9nh7ggIeug myname@monash.edu
The key's randomart image is:
+---[RSA 4096]----+
|        .o+o.    |
|       . +.      |
|      o + .o o   |
|     . o O  = .  |
|      +.S *  + . |
|     .oB.*.o  +. |
|     o....=.. ..+|
|    . .  . +.+.o+|
|     E      =.oo+|
+----[SHA256]-----+
```

> *__Note:__* In the likely case you do not fully understand what the `ssh-keygen` command does, nor what do their flags and arguments mean, that is ok, even if you are not 100% sure of what you are doing. It is important that you adquire the ability to follow a list of commands even without completely understanding them. If you are interested, you can read more about SSH keys [here](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh). 

> *__Note:__* When generating the private key above, we did not actually provide any passphrase, we just hit the Return key, which means no passphrase. However, it is, in general, **highly recommended** to have a  passphrase. The passphrase is used as an additional protection of your private key in case it is stolen. In particular, it is used to cypher the contents of the private key before storing it into the `id_rsa` file. We did not actually use it for simplicity, i.e., in order to avoid Git asking it in the command-line each time that we have to interact with GitHub.
In any case, even with a passphrase, one can avoid Git asking it using the so-called [SSH Agent](https://en.wikipedia.org/wiki/Ssh-agent). The usage of SSH Agent is, however, out of the scope of this tutorial.

If the command suceeded, there should be (at least) two different files in the `~/.ssh/` folder named `id_rsa` and `id_rsa.pub`:

```
amar0078@MVAZ1STUL01023 ~/Documents$ ls -l ~/.ssh
total 9
-rw-------+ 1 amar0078 Domain Users 3434 Feb 24 21:53 id_rsa
-rw-r--r--+ 1 amar0078 Domain Users  743 Feb 24 21:53 id_rsa.pub
-rw-rw-r--+ 1 amar0078 Domain Users  404 Feb 24 21:43 known_hosts
```

The former file (`id_rsa`) contains the private key, while the latter (`id_rsa.pub`) the public one.  **You should never expose nor send to anyone the private key** (note indeed its very restricive file permissions). On the other hand, the public key can be shared with anyone, i.e., GitHub in our case. 

Once we have created the SSH keys, we have to associate the public key to your GitHub profile. To this end, you have to [login into GitHub](https://github.com/login) using your GitHub's user e-mail and password. Once you are logged in, in the upper-right corner of any page, click on your profile photo, and then on the drop-down list, click on "Settings". Then, on the left frame, click on "SSH and GPG keys". You should arrive to the screen shown in [Figure 1](fig:ssh_keys).

<a name="fig_ssh_keys_1"></a> ![fig:ssh_keys_1](figures/add_ssh_key_step1.png)
Figure 1. Linking your public SSH key with your GitHub account. (Step 1)


> *__Note:__*  GitHub actively develops its user interface, so
[Figure 1](fig:ssh_keys) and other GitHub screenshots shown along the section may not match the ones that you are observing in your browser exactly, but this is not a cause for concern. We expect you to be able to resolve any discrepancies on your own.


Then, you have to click on the "New SSH key" green button at the top right of [Figure 1](fig:ssh_keys). You will then arrive to the screen in [Figure 2](fig:ssh_keys_2).

<a name="fig_ssh_keys_2"></a> ![fig:ssh_keys_2](figures/add_ssh_key_step2.png)
Figure 2. Linking your public SSH key with your GitHub account. (Step 2)

In [Figure 2](fig:ssh_keys_2), you have to fill two text boxes, the one labelled as "Title", and the one labelled as "Key". First, in the one labelled as "Title" you can put whatever (intention revealing) name you like to your key. In this case, we put "Public Key at MVAZ1STUL01023's Cygwin node", where `MVAZ1STUL01023` is the name of the MoVE compute node that is hosting the public key (you can retrieve it from `bash` shell prompt or typing the `hostname` command.) Second, in the one labelled as "Key" you have to put your public SSH key, that is, the contents of the previously generated `id_rsa.pub` file. To this end, you can display on screen the contents of the file:

```bash
cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPZc7IIUvIlcGWgh7/jQLFYIryLk7Zs9XSk60CTllD6NmAjJKKoPBVdT21I2yEryEhAQA+EQmwb8xSlmkcOskSLTsoXdXVZe1blajHIA3CdhaBXpGiw5oDGeVInaOlcqq2faXwZttw3FD4Unf+OFtqCKR0e9uIFcMjpyQklE3z3SdIFKX+aXGrweqaVq8ByxwXSQIjvXibcxBsvCuMvL8VfcsgMDu+1Z1TzEG9NKnDOqp2lTrF6QvSqAmlJ7OtSBsmVIHje1egDyPQD5JY04tV8ETSSqZpOFg3UZ6vBS4ZXpFixNXrvOo5HBrwh9E566tmJfnoBPWLdV6orHETQHjsRMI2FsWOhPQ/GEuZw66PlirjIechPdVrmKFhthwgYSlyXydxrfpPInCe51sTs1J2Ix0lZUdioyLn4RycfhBSVvcU49FxmxA8c3qBIXVSFFIyRdLlOJYgLhCqzvdZTqNMeIaR8LzUeitexQfyUFhknkJghjBp1+i7BOFJvLQ/55gIfLXd3nTtDflCV9Lj0joAVcTmiirlBg29iqX9q2LHI6jBhlOBL1SsDOaHfeIMuJvLzEmE80GBNkk6CsdilwdTFx7jlBUeU4//6G6aRIycZ5jsoTXfFiwp6ogvpZ3Gc7ag48rmENF1NgQRrSDkfYfhoNc+NckDbt8O+Diqy8LDhQ== myname@monash.edu
```
and then copy & paste its contents from the command-line to the "Key" text box. Finally, you have to click on the "Add SSH key" button in [Figure 2](fig:ssh_keys_2). This should reach the screen in [Figure 3](fig:ssh_keys_3), where your key is already listed.

<a name="fig_ssh_keys_3"></a> ![fig:ssh_keys_3](figures/add_ssh_key_step3.png)
Figure 3. Linking your public SSH key with your GitHub account. (Step 3)


> *__Note:__* In general, the process so far with the SSH keys is a one-time process per computer, user on that computer, and GitHub account.
However, as already mentioned several times before, the contents of the home directory might vary among different Cygwin terminal sessions, e.g., when you close a terminal and open a new one. In the particular case of Git, the consequence of this behaviour is that the SSH keys that you have generated on the `~/.ssh/` folder in a given session might not available in a different (future) session. In such a case, you have to generate a new pair of SSH keys and link the new public SSH key with your GitHub user again. 

### 1.8.3. Creating a new GitHub project (and associated Git repository)
<a id="markdown-creating-a-new-github-project-and-associated-git-repository" name="creating-a-new-github-project-and-associated-git-repository"></a>

To create a new project in GitHub (and an associated Git repository on the Cloud), log in and go to the GitHub user's home page (if you do not find it, then just insert https://github.com/ on the browser once you are logged in). You should see a similar screen to that in [Figure 4](#fig:github_home). 


<a name="fig_github_home"></a> ![fig:github_home](figures/start_a_project_github.png)
Figure 4. GitHub user's home page.

Click on "Start a project". You will be redirected to the page in [Figure 5](fig:github_new_repo). There, you have to provide a name for your GitHub Git repository (let us call it `repository4sci1022`), a Description (let us put "This is my first repository for the SCI1022 Introduction to Version Control using Git"), and finally whether we want our repository to be Public or Private. As we want to ship our project to the wide world, we will use Public in this case. Finally, we have to click on the "Create Repository" button in [Figure 5](fig:github_new_repo).

<a name="fig_github_new_repo"></a> ![fig:github_new_repo](figures/create_new_repo_github.png)
Figure 5. GitHub's "Create a new repository" page.

After this process, our GitHub repository has been already created. It can be accessed from a web browser using the following URL: `https://github.com/github_username/repository4sci1022`, where obviously you have to replace `github_username` by your GitHub's user name. When you visit that page, you will get an screen similar to that shown in [Figure 6](fig:github_repo_quick_setup).

<a name="fig_github_repo_quick_setup"></a> ![fig:github_repo_quick_setup](figures/github_repo_quick_setup.png)
Figure 6. A just created GitHub project.

Essentially the page in [Figure 6](fig:github_new_repo) is informing us that the GitHub Git repo is void. Besides, it offers us several possibilities in order to populate it. 

### 1.8.4. Pushing into the remote Git repository at GitHub
<a id="markdown-pushing-into-the-remote-git-repository-at-github" name="pushing-into-the-remote-git-repository-at-github"></a>

We want to populate our fresh Git repository at GitHub with the contents of the **local** Git repository that we created from the Cygwin terminal in [Section 1.5](). In order to do so, we have to execute the commands shown under the "... or push an existing repository from the command line" header in [Figure 6](fig:github_new_repo) in the Cygwin terminal. That is, we want to push our local repository up to GitHub. The exact commands will be tailored to your personal account name. In our case, the commands to be executed are:

```bash
$ git remote add origin git@github.com:amartinhuertas/repository4sci1022.git
$ git push -u origin master
Warning: Permanently added the RSA host key for IP address '13.236.229.21' to the list of known hosts.
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 290 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:amartinhuertas/repository4sci1022.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
Of course, you should replace `amartinhuertas` by your Github actual username. These two commands set GitHub as the **origin** remote repository of the local Git repository and then push the full (local) repository there, respectively. The **origin** is the default remote repository that one interacts with when you do not explicitly specify a remote repository in a git command. We note that a local repository might be connected to several remote repositories.  The `-u` option to `git push` sets GitHub as the upstream repository, which
means that we will be able to download any changes automatically when we run `git pull`. Do not worry about these details, though; you will almost always copy such commands from GitHub and probably will not ever have to figure them out on your own.

----
> *__Exercise 5:__* 
----



```
~/Documents$ rm -Rf myproject/
```

```
amar0078@MVAZ1STUL01023 ~/Documents$ git clone git@github.com:amartinhuertas/repository4sci1022.git
Cloning into 'repository4sci1022'...
Enter passphrase for key '/home/amar0078/.ssh/id_rsa':
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
```


```
amar0078@MVAZ1STUL01023 ~/Documents$ cd repository4sci1022/
amar0078@MVAZ1STUL01023 ~/Documents/repository4sci1022$ cat README.md
This is an **example** README.md file
```

```
amar0078@MVAZ1STUL01023 ~/Documents/repository4sci1022$ git log
commit 057083ac5d9e2718626854c90b2ba6226e6f57f2 (HEAD -> master, origin/master, origin/HEAD)
Author: My name <myname@monash.edu>
Date:   Mon Feb 24 21:28:03 2020 +1100

    First commit of myproject with a preliminary version of a README.md file
```

