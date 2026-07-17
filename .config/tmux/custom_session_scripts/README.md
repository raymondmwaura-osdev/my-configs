# Custom Session Scripts

+ This directory contains tmux scripts that set up a tmux session for a specific use. For example, `keystash.sh` creates a tmux sessions and opens terminals I need to start working on the `keystash` project.
+ To be able to run these scripts from any working directory, hard link them to `~/.local/bin/` without the `.sh` extension (i.e. `keystash.sh` becomes `keystash`).
+ Use `link_scripts.sh` to create the hard links.
  ```
  ./link_scripts.sh
  ```

---
