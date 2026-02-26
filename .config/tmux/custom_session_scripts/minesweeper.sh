#!/bin/bash
WORKING_DIR=/mnt/data/minesweeper
SESSION=minesweeper
if ! tmux has-session -t $SESSION 2> /dev/null; then
    tmux new -d -s $SESSION -c $WORKING_DIR
    tmux new-window -d -t $SESSION -c $WORKING_DIR nvim
fi

tmux attach -t $SESSION -c ~
# Use '-c ~' to reset the directory where new sessions will be created.
