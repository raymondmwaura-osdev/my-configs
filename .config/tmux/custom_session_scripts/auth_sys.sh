#!/bin/bash
# This shell scripts adds windows to the "web_dev" session. These new
# windows are used when working on the authentication system project.
# New windows:
#   1. 'auth_sys': A terminal opened in the directory containing the authentication system project.
#   2. 'code_auth_sys`: An nvim session opened in the authentication system project directory.

PROJECT_DIR=/mnt/data/authentication_system

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

if ! tmux_has_window auth_sys; then
    tmux new-window -d -t $SESSION -n auth_sys -c $PROJECT_DIR
    tmux send-keys -t $SESSION:auth_sys "source venv/bin/activate" Enter
fi

if ! tmux_has_window code_auth_sys; then
    tmux new-window -d -t $SESSION -n code_auth_sys -c $PROJECT_DIR nvim
fi

tmux attach -t $SESSION -c ~
