#!/bin/bash

SESSION=ringzeroacademy_frontend
REPO_DIR=/mnt/data/RingZeroAcademy/frontend

if ! tmux has-session -t $SESSION 2> /dev/null ; then
    tmux new -d -s $SESSION -c $REPO_DIR -n editor nvim
    tmux new-window -d -t $SESSION -c $REPO_DIR -n server
    tmux send-keys -t ${SESSION}:server "npm run dev" Enter
    tmux new-window -d -t $SESSION -c $REPO_DIR -n terminal
fi

tmux attach -t $SESSION -c ~
