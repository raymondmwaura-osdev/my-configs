# My Configs

This repository tracks the config files on my linux machine.

The method explained here is not meant to be a permanent way of tracking the config files. I will change it when I find a better way.

## How to setup on a newly installed Linux machine

+ On a newly installed Linux machine, clone this repository into `~/my-configs`.
+ Hard link all the files in `~/my-configs/home_directory` to the user's home directory (maintain the directory structure).
+ Hard link all the files in `~/my-configs/root_directory` to the root directory (also maintain the directory structure).
+ Now all the config files are where they are expected by the respective programs.

I'm working a tool that will setup everything.

---

## Tracking files

+ When any of the tracked files changes, track it with `git`. You'll have to run git from within the `~/my-configs` directory. For example, if `/etc/fstab` changes, the `~/my-configs/root_directory/etc/fstab` file will also change because the two are hard links to the same data on disk. Change into the `~/my-configs` directory and `git add` and `git commit` the file.
+ When you want to track a new file that is not in `~/my-configs` directory, create a hard link of that file in the `~/my-configs` directory, while maintaining the directory structure, then use `git` to track it.


---
