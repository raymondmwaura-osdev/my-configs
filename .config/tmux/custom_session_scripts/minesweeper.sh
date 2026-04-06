#!/bin/bash
WORKING_DIR=/mnt/data/minesweeper
STATIC_DIR=${WORKING_DIR}/static/main
BACKEND_DIR=${WORKING_DIR}/fullstack/backend
FRONTEND_DIR=${WORKING_DIR}/fullstack/frontend
SESSION=minesweeper
if ! tmux has-session -t $SESSION 2> /dev/null; then
    tmux new -d -n general -s $SESSION -c $WORKING_DIR
    tmux new-window -d -n general_nvim -t $SESSION -c $WORKING_DIR nvim
    tmux new-window -d -n static -t $SESSION -c $STATIC_DIR
    tmux new-window -d -n nvim_static -t $SESSION -c $STATIC_DIR nvim
    tmux new-window -d -n backend -t $SESSION -c $BACKEND_DIR
    tmux new-window -d -n nvim_backend -t $SESSION -c $BACKEND_DIR nvim
    tmux new-window -d -n frontend -t $SESSION -c $FRONTEND_DIR
    tmux new-window -d -n nvim_frontend -t $SESSION -c $FRONTEND_DIR nvim
fi

tmux attach -t $SESSION -c ~
# Use '-c ~' to reset the directory where new sessions will be created.
