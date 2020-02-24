<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

# Introduction to [Version control](https://en.wikipedia.org/wiki/Version_control) using [Git](https://git-scm.com/) (2h 40min).

This tutorial provides an introduction to Version Control using a particular software tool called [Git](https://en.wikipedia.org/wiki/Git). 
Git belongs to a **crucial class** of tools in the scientific coding workflow referred to as [Version Control Systems](https://en.wikipedia.org/wiki/Version_control) (VCSs). A VCS is an special program that provides an **automatic and effective** way to track changes in your project files and directories. It allows you to effectively “save your work" (referred to as *"commit your work"* in VCS parlance) at selected points in the development timeline, and to view/retrieve the files and directories in the status corresponding to any of these save points in the past as desired. It provides a definitive automated solution to the still widely-used bad practice of manual tracking of changes based on cumbersome file naming conventions. This is better illustrated graphically with the "notFinal.doc" comic by Jorge Cham available [here](http://phdcomics.com/comics/archive.php?comicid=1531). It is clearly not practical to have multiple nearly-identical versions of the same document with such cumbersome file names. Nowadays, applications like
[Microsoft Word](https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a), [Google Docs](https://support.google.com/docs/answer/190843?hl=en), or [LibreOffice](https://help.libreoffice.org/Common/Recording_and_Displaying_Changes) do offer built-in version tracking, but such features are tightly coupled to the underlying application and are not useful for any other document types.


Beyond the aforementioned, modern VCSs allow you to **develop disruptive, speculative features** without affecting the main development trunk. Besides, with a VCS, you can keep **remote, offsite backups** of your project files and history, e.g., using a repository hosting service in the Cloud such as [GitHub](https://github.com/). You may likely find someone (or even you did experience it yourself) that has **lost work**, e.g., by accidentally removing it, due to corrupted hard-drives, etc. Although it is still possible to loose data using a VCS, the probability and amount of data loss are minimized if one keeps a systematic and appropriate workflow while using the tool. Last but not least, a VCS lets you **collaborate easily and conveniently** with others, and to **ship your product**, i.e., to expose your work to the **public domain**. However, teams are not the only ones to benefit from version control. If you are working alone in your project, say a class assignment, you can benefit immensely as well. 
Keeping track of what was changed, when, and why, is extremely helpful if you interrupt the project development and have to come to it later on, when most probably your memory has become fuzzy and likely to fail.  

VCSs have evolved considerably over the years, and still nowadays, there are a number of alternatives to [Git](https://git-scm.com/). [Wikipedia](https://en.wikipedia.org/wiki/Template:Version_control_software) provides a pretty comprehensive picture of the (overwhelming) variety of past and present VCSs.  The family line leading to Git includes [RCS](https://en.wikipedia.org/wiki/Revision_Control_System), [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System), and [SVN](https://en.wikipedia.org/wiki/Apache_Subversion), although there are timely alternatives to Git as well, such as, e.g., [Mercurial](https://en.wikipedia.org/wiki/Mercurial), or [Bazaar](https://en.wikipedia.org/wiki/GNU_Bazaar), to name a few. In contrast to RCS, CVS, SVN, which are considered nowadays outdated technology, modern VCSs, such as Git or Mercurial, are [**distributed VCSs**](https://git-scm.com/about/distributed), meaning that they do not need a centralized server to host the repository. **Every local copy of a remote repository (referred to as a "clone" in the Git parlance) is a fully working copy.** In case there is a problem with the computer originally hosting the remote repository (e.g., it becomes corrupted or lost), any local copy can recreate the full history. On the contrary, in a centralized VCS, there is a unique server that contains all changes in the project and the local copies are just light versions it. If the server goes down, you lose all the history. 

Why did we choose Git for this tutorial? There are a number of reasons, but the most important are perhaps the following ones. Git has a remarkable balance among speed, efficiency, and ease-of-use. Indeed, this hallmark of Git has positioned it to be undoubtedly the de-facto standard VCS  used in ([open source](https://opensource.com/resources/what-open-source)) scientific software projects. Git was originally developed in 2005 by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), the same individual who created the Linux OS, i.e., an open source variant of Unix.  Therefore, it is also (as could not be otherwise) **[free and open source](https://git-scm.com/about/free-and-open-source)**. Since then, its popularity has increased significantly, mostly due to the development of repository hosting services in the Cloud such as  [Github](https://github.com/), [Gitlab](https://about.gitlab.com/), or [BitBucket](https://en.wikipedia.org/wiki/Bitbucket). Indeed, **virtually the whole state-of-the-art in open source (scientific and not necessarily scientific) software is available at these Git repository hosting services**. Finally, it is worth mentioning that Git is available on multiple platforms, including Microsoft Windows, Linux, or macOS, among others.

Git comes in the form of a Unix-like command-line program. Recall that in the [previous tutorial](Unix-CLI.md), we introduced you to the Unix command-line. Fortunately, this introduction is more than you need to start using Git from the command-line. While there are [some great GUI-based tools](https://git-scm.com/downloads/guis/) that can be used on top of Git, it is more convenient to learn Git using git-specific commands first and then to try out a GUI-based solution once you are more comfortable with the command. In particular, we will use the Git version that is already installed along with [Cygwin](https://www.cygwin.com/) at [MoVE](https://www.monash.edu/learning-teaching/innovation/educational-technologies/move), so that we do not assume any installation prerequisite to follow this tutorial. In any case,  if you wish to install Git on your system, you can follow the instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). One helpful command for learning Git is `git help` , which by itself gives general guidelines on Git usage, and when applied to a specific command gives further information on that
command. For example, `git help add` shows details about the `git add` command. The output of `git help` is similar to the man pages covered in
our introduction to the Unix command-line, so that they can sometimes cryptic and hard to understand for non-advanced Git users. Therefore, it you struggle to understand the help messaged output by Git, do not panic, there are plenty of alternative resources on the Internet that might help you when you feel youself stuck. 

In this tutorial we do not pretend to be too comprehensive. The advanced features of Git are tricky to learn, and are based to a large extent on theory concepts that are hard to grasp and thus pretty too much for an introductory tutorial. Instead, we will cover the very minimal set of features and associated commands that let you start becoming productive with such a sophisticated tool. Right at the end of the tutorial, we will point you to a set of further references that you can use to expand your Git skills much further.


Misc git commands

$ git config --global user.name "My name"
$ git config --global user.email "myname@monash.edu"
$ git config --list --show-origin

$ cd Documents/
$ mkdir myproject
$ cd myproject/
$ git init
Initialized empty Git repository in /home/amar0078/Documents/myproject/.git/
$ nano README.md
$ cat README.md
This is an **example** README.md file
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        README.md

nothing added to commit but untracked files present (use "git add" to track)

$ git add README.md
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   README.md

git commit -m "First commit of myproject with a preliminary version of a README.md file"
[master (root-commit) 057083a] First commit of myproject with a preliminary version of a README.md file
 1 file changed, 1 insertion(+)
 create mode 100644 README.md

$ git log
commit 057083ac5d9e2718626854c90b2ba6226e6f57f2 (HEAD -> master)
Author: My name <myname@monash.edu>
Date:   Mon Feb 24 21:28:03 2020 +1100

    First commit of myproject with a preliminary version of a README.md file

$ git remote add origin git@github.com:amartinhuertas/repository4sci1022.git
$ git remote -v
origin  git@github.com:amartinhuertas/repository4sci1022.git (fetch)
origin  git@github.com:amartinhuertas/repository4sci1022.git (push)
$ git push -u origin master

amar0078@MVAZ1STUL01023 ~/Documents$ ssh-keygen -t rsa -b 4096 -C "myname@monash.edu"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/amar0078/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
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
amar0078@MVAZ1STUL01023 ~/Documents$ ls -l ~/.ssh
total 9
-rw-------+ 1 amar0078 Domain Users 3434 Feb 24 21:53 id_rsa
-rw-r--r--+ 1 amar0078 Domain Users  743 Feb 24 21:53 id_rsa.pub
-rw-rw-r--+ 1 amar0078 Domain Users  404 Feb 24 21:43 known_hosts

amar0078@MVAZ1STUL01023 ~/Documents$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPZc7IIUvIlcGWgh7/jQLFYIryLk7Zs9XSk60CTllD6NmAjJKKoPBVdT21I2yEryEhAQA+EQmwb8xSlmkcOskSLTsoXdXVZe1blajHIA3CdhaBXpGiw5oDGeVInaOlcqq2faXwZttw3FD4Unf+OFtqCKR0e9uIFcMjpyQklE3z3SdIFKX+aXGrweqaVq8ByxwXSQIjvXibcxBsvCuMvL8VfcsgMDu+1Z1TzEG9NKnDOqp2lTrF6QvSqAmlJ7OtSBsmVIHje1egDyPQD5JY04tV8ETSSqZpOFg3UZ6vBS4ZXpFixNXrvOo5HBrwh9E566tmJfnoBPWLdV6orHETQHjsRMI2FsWOhPQ/GEuZw66PlirjIechPdVrmKFhthwgYSlyXydxrfpPInCe51sTs1J2Ix0lZUdioyLn4RycfhBSVvcU49FxmxA8c3qBIXVSFFIyRdLlOJYgLhCqzvdZTqNMeIaR8LzUeitexQfyUFhknkJghjBp1+i7BOFJvLQ/55gIfLXd3nTtDflCV9Lj0joAVcTmiirlBg29iqX9q2LHI6jBhlOBL1SsDOaHfeIMuJvLzEmE80GBNkk6CsdilwdTFx7jlBUeU4//6G6aRIycZ5jsoTXfFiwp6ogvpZ3Gc7ag48rmENF1NgQRrSDkfYfhoNc+NckDbt8O+Diqy8LDhQ== myname@monash.edu

amar0078@MVAZ1STUL01023 ~/Documents/myproject$ git push -u origin master
Warning: Permanently added the RSA host key for IP address '13.236.229.21' to the list of known hosts.
Enter passphrase for key '/home/amar0078/.ssh/id_rsa':
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 290 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:amartinhuertas/repository4sci1022.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

~/Documents$ rm -Rf myproject/

amar0078@MVAZ1STUL01023 ~/Documents$ git clone git@github.com:amartinhuertas/repository4sci1022.git
Cloning into 'repository4sci1022'...
Enter passphrase for key '/home/amar0078/.ssh/id_rsa':
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
amar0078@MVAZ1STUL01023 ~/Documents$ cd repository4sci1022/
amar0078@MVAZ1STUL01023 ~/Documents/repository4sci1022$ cat README.md
This is an **example** README.md file
amar0078@MVAZ1STUL01023 ~/Documents/repository4sci1022$ git log
commit 057083ac5d9e2718626854c90b2ba6226e6f57f2 (HEAD -> master, origin/master, origin/HEAD)
Author: My name <myname@monash.edu>
Date:   Mon Feb 24 21:28:03 2020 +1100

    First commit of myproject with a preliminary version of a README.md file


