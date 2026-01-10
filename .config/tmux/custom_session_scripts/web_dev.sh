#!/bin/bash
# This shell script sets up a simple tmux session used when learning
# web development and working on simple projects.
# The session has 6 windows:
#   1. A terminal opened in $NOTES_DIR. This terminal can be used for things
#       that can't be done in an editor, like using git, moving and removing files, etc.
#   2. An nvim session opened in the directory containing HTML notes.
#   3. An nvim session opened in the directory containing CSS notes.
#   4. An nvim session opened in the directory containing JavaScript notes.
#   5. A terminal opened in the directory containing a project being worked on.
#   6. An nvim session opened in the project directory.

SESSION="web_dev"
NOTES_DIR=/mnt/data/FullStackJournal
PROJECT_DIR=/mnt/data/todo-app
PROJECT_NAME=todo_app

tmux has -t $SESSION 2> /dev/null
if [[ $? != 0 ]]; then
    tmux new-session -d -s $SESSION -n notes -c $NOTES_DIR
    tmux new-window -d -t $SESSION -n html -c ${NOTES_DIR}/html/ nvim
    tmux new-window -d -t $SESSION -n css -c ${NOTES_DIR}/css/ nvim
    tmux new-window -d -t $SESSION -n javascript -c ${NOTES_DIR}/javascript/ nvim
    tmux new-window -d -t $SESSION -n $PROJECT_NAME -c ${PROJECT_DIR}
    tmux new-window -d -t $SESSION -n code -c ${PROJECT_DIR} nvim
fi

tmux attach -t $SESSION -c ~ # Use `-c ~` to reset where new sessions/windows are opened.
