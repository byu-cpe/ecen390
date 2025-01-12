---
title: Getting Started
nav_order: 2
---
{%- include vars.html -%}

# Getting Started
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

-----

## Host Computer
You will need a host computer to compile and download programs to the
laser tag unit. You have a few options available.

### Option 1: Use a lab computer
Computers with the required software are set up and available in the
Analog Lab (EB 424,425). You can login to these machines using your
CAEDM login.

{: .highlight }
We recommend that you work in the lab as everything is set up for you
and ready to go. It's also easier for you to get help from the
instructor and TAs if you are in the lab.

### Option 2: Use your own computer
You may choose to use your own computer so you can work remotely. This
option requires you to install the Espressif development tools on your
personal computer. A limited install requires about 3 Gigabytes of disk
space. Installation is supported on Windows, Mac, and Linux operating
systems. Instructions can be found at the following link.

[Get Started, Introduction, Installation](
https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/)

## Group File Share

You can use a [CAEDM group](
https://caedm.et.byu.edu/wiki/index.php/CAEDM_groups) to
share code with others in your project. A CAEDM group gives you a
shared file space to save your project code and collaborate. You are
**NOT** allowed to use a GitHub repository or other external site to
store your code. You can create a CAEDM group yourself through the
following link. You will be required to login first with your CAEDM
password.

[Create a CAEDM Group](https://caedm.et.byu.edu/cms/addgroup.php)

<!-- Indicate what a typical path looks like to the group space. -->

If you want to have revision control of your source code in the group
file space, you can create a _bare_ git repository in the shared space.
Then you will be able to check-in and check-out files with `git` from
the shared file space to your personal file space (i.e., J Drive, home
directory) similar to what you would do with GitHub. The main difference
here is that your files are hosted on CAEDM servers instead of GitHub
servers.

<!--
https://www.reddit.com/r/git/comments/kx9xtx/how_to_setup_a_remote_git_repository_on_a_local/?rdt=42223
https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Quickly-create-a-git-bare-repo-with-init-or-clone
https://saraford.net/2017/03/03/how-to-create-your-own-local-git-remote-repo-thats-not-hosted-on-a-git-server-bare-option-062/
https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server --shared option
 -->

<!-- The following source gives instructions on how to setup
a _bare_ git repository.

[]() -->

## Lab Environment
In this section, you will find instructions on:

  - Downloading the repository of starting code
  - Editing source code
  - Setting up the build environment
  - Building source code
  - Downloading code to run on the ESP32 processor

### Starting Code Repository

To complete the work for this course, you are provided a repository of
starting code, available here: <https://github.com/byu-cpe/ecen390>.

You can clone this code from GitHub into a sub-directory called
_ecen390_ in your home directory using the following command:

`git clone https://github.com/byu-cpe/ecen390_student ~/ecen390`

### Editing Source Code

A significant amount of your lab time will be spent editing source code.
Visual Studio (VS) Code is available on the lab computers. In a terminal
window, you can start VS Code by first changing your working path to the
project directory. Then run `code`.

```
cd ecen390/ltag
code
```

### Building and Running Applications

Applications are built on the host computer before they are download and
programmed into the flash memory on the ESP32 processor. The ESP-IDF
tools environment must be setup each time a new terminal window is
opened to build an application. First, change your working path to the
project directory:

`cd ecen390/ltag`

From within a project directory, the environment is setup by typing:

`source ../myidf.sh`

After setting up the environment, an application is built by typing:

`idf.py build`

Make sure a USB cable is connected from the host computer to the ESP32
device. An application is then downloaded and run by typing:

`idf.py flash monitor`

To escape the ESP monitor and return to the command prompt, type
<span style="color:red;">**`control-]`**</span> (control key + right
bracket).

### Getting Help

A help queue and a pass-off queue will be maintained on the whiteboard
in EB 424 (Analog Lab).


See [TA Hours](https://learningsuite.byu.edu/cid-jeh4l-DgWhAN/pages/id-iC6I)
for a weekly schedule of when TAs are available.

### Resources

[Visual Studio Code Documentation](https://code.visualstudio.com/docs)

[ESP-IDF Programming
Guide](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/index.html)

[ESP-IDF Build System](
https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-guides/build-system.html)
