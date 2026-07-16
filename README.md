# My Configs

+ This repository tracks the config files for my user on linux.
+ The repository is in `~/my-configs`.
+ The tracked files are in the usual locations like: `~/.config/`.
+ Not all config files are tracked, only the ones I want.
+ Since they are in a different directory as the repository (repo is in `~/my-configs`, files are in `~/.config`), they cannot be directly tracked by git.
+ To be able to track them, create hard links for the files you wish to track. For example, to track `~/.config/sway/config`, create a hard link to `~/my-configs/.config/sway/config`. **Maintain the directory structure.** Then start tracking the file.
  ```
  ln ~/.config/sway/config ~/my-configs/.config/sway/config
  ```

+ This is not meant to be a permanent way of tracking the config files. I will change it when I find a better way.

---
