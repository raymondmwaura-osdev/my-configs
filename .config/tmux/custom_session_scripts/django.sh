#!/bin/bash
NOTES_DIR=/mnt/data/python-notes-and-insights/django
PROJECT_DIR=${NOTES_DIR}/poll_application/project_dir
SESSION=django
if ! tmux has-session -t $SESSION 2> /dev/null; then
    tmux new -d -s $SESSION -c $NOTES_DIR -n main
    tmux send-keys -t ${SESSION}:main "source venv/bin/activate" Enter
    tmux new-window -d -n notes -t $SESSION -c $NOTES_DIR nvim
    tmux new-window -d -n project -t $SESSION -c $PROJECT_DIR nvim
fi

tmux attach -t $SESSION -c ~
# Use '-c ~' to reset the directory where new sessions will be created.
