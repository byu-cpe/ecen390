---
title: Git Repositories
nav_order: 3
---
{%- include vars.html -%}

# Git Repositories
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

-----

A bare repository just keeps track of commits, but doesn't bother with
keeping a working directory. Files are stored as "blobs" in a bare git
repository and are not directly readable by a user. To view files stored
in a git bare repository, you must first clone it into a local
repository that includes a working directory of source code. A bare
repository typically resides on a shared server and is often referred to
as a remote repository. Since you don't have permission to write to the
starting code repository, you will need to make a copy of it on a server
where you do have permission.

![]({{media}}git_repos.png)

First, identify or create a
[group-accessible file directory]({{site.baseurl}}/docs/getting-started/#group-file-share).
This directory is called `<group_dir>` in the instructions below.

## Create a Group, Bare Repository

```sh
cd <group_dir>
git clone --bare --shared https://github.com/byu-cpe/ecen390_student ecen390.git
```

{: .note }
When initializing (or cloning) a bare git repository for your group,
remember to use the `--bare` and `--shared` options. Without the
`--shared` option, your group mate will not have permission to push to
the repository.

## Create a Personal, Local Repository

```sh
git clone ~/groups/<group_dir>/ecen390.git ~/ecen390
```

The command above will create a directory called `ecen390` at the top
level of your home directory. This repository will contain a working
directory of the files in your project. It is your personal workspace
to make edits and then commit any changes to the group repository.

If a group mate commits any changes to the group repository, you can
pull those changes into your working directory by typing `git pull`.
If you want to post changes you have made to a file called `my_file.c`,
use the following sequence of commands.

```sh
git add my_file.c
git commit -m "update to my_file.c"
git push
```

For more details about using git, see [this tutorial](https://git-scm.com/docs/gittutorial).

## Add Remote Repository

```sh
cd ~/ecen390
git remote add start https://github.com/byu-cpe/ecen390_student
```

## Pull from Starting Code

```sh
git pull start main
# Alternatively, if a conflict arises:
git pull --rebase start main
```

Updates to the starting code may be made throughout the semester. Before
starting a new milestone, it is recommended that you pull any changes
into your local repository from the starting code.
