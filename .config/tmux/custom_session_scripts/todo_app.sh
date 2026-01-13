#!/bin/bash
# This shell scripts adds windows to the "web_dev" session. These new
# windows are used when working on the todo-app project.
# New windows:
#   1. 'todo_app': A terminal opened in the directory containing the todo-app project.
#   2. 'code_todo_app`: An nvim session opened in the todo app project directory.

PROJECT_DIR=/mnt/data/todo-app

# Create main web dev session.
cd "$(dirname $0)"
source web_dev.sh 0 # 'source' to be able to access its variables.

# Add windows.
tmux_has_window() {
    # Check if the tmux session $SESSION contains the specified window.
    # The name of the window is expected to be in $1.
    if tmux list-windows -t $SESSION \
        -F "#{window_name}" \
        | grep -w $1 > /dev/null; then
        return 0
    else
        return 1
    fi
}

if ! tmux_has_window todo_app; then
    tmux new-window -d -t $SESSION -n todo_app -c $PROJECT_DIR
fi

if ! tmux_has_window code_todo_app; then
    tmux new-window -d -t $SESSION -n code_todo_app -c $PROJECT_DIR nvim
fi

tmux attach -t $SESSION -c ~
