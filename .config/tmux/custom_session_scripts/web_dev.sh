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
#       that can't be done in an editor, like using git, moving and removing files, etc.
#   2. 'html': An nvim session opened in the directory containing HTML notes.
#   3. 'css': An nvim session opened in the directory containing CSS notes.
#   4. 'javascript': An nvim session opened in the directory containing JavaScript notes.
ATTACH=${1:-1}
SESSION="web_dev"
NOTES_DIR=/mnt/data/FullStackJournal

# Create the session and windows.
tmux has -t $SESSION 2> /dev/null
if [[ $? != 0 ]]; then
    tmux new-session -d -s $SESSION -n notes -c $NOTES_DIR
    tmux new-window -d -t $SESSION -n html -c ${NOTES_DIR}/html/ nvim
    tmux new-window -d -t $SESSION -n css -c ${NOTES_DIR}/css/ nvim
    tmux new-window -d -t $SESSION -n javascript -c ${NOTES_DIR}/javascript/ nvim
fi

# Attach the session.
if [[ $ATTACH -eq 1 ]]; then
    tmux attach -t $SESSION -c ~ # Use `-c ~` to reset where new sessions/windows are opened.
fi
