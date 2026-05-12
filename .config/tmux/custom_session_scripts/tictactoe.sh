#!/bin/bash

WORKING_DIR=/mnt/data/tictactoe
SESSION=tictactoe
if ! tmux has-session -t $SESSION 2> /dev/null; then
    tmux new -d -s $SESSION -c $WORKING_DIR nvim
    tmux new-window -d -n server -t $SESSION -c $WORKING_DIR
    tmux send-keys -t ${SESSION}:server "npm run dev" Enter
    tmux new-window -d -n terminal -t $SESSION -c $WORKING_DIR
fi

tmux attach -t $SESSION -c ~
# Use '-c ~' to reset the directory where new sessions will be created.
