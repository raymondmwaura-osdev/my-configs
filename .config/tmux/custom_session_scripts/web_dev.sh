#!/bin/bash
# This shell script sets up a simple tmux session used when learning
# web development.
#
# The script takes one optional parameter.
# This parameter determines whether the session will be attached or not
# after it has been created.
#   1 (default): attach
#   0: don't attach
# This parameter is used by other scripts which add more windows
# to this session, and don't want the session to be attached before the
# new windows are added.
#
# The session has the following windows:
#   1. 'notes': A terminal opened in $NOTES_DIR. This terminal can be used for things
#       that can't be done in an editor.
#   2. 'nvim_notes': An nvim session opened in $NOTES_DIR.
ATTACH=${1:-1}
SESSION="web_dev"
NOTES_DIR=/mnt/data/FullStackJournal

# Create the session and windows.
tmux has -t $SESSION 2> /dev/null
if [[ $? != 0 ]]; then
    tmux new-session -d -s $SESSION -n notes -c $NOTES_DIR
    tmux new-window -d -t $SESSION -n nvim_notes -c ${NOTES_DIR} nvim
fi

# Attach the session.
if [[ $ATTACH -eq 1 ]]; then
    tmux attach -t $SESSION -c ~ # Use `-c ~` to reset where new sessions/windows are opened.
fi
