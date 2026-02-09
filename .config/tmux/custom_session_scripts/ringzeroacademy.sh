#!/bin/bash

SESSION=ringzeroacademy
DESIGN_DIR=/mnt/data/RingZeroAcademy/ringzeroacademy/design
TUTORIAL_PAGE_DIR=${DESIGN_DIR}/tutorial_page
WORKING_DIR=$DESIGN_DIR

if ! tmux has-session -t $SESSION 2> /dev/null ; then
    tmux new -d -s $SESSION -c $WORKING_DIR
    tmux new-window -d -t $SESSION -c $WORKING_DIR nvim
fi

tmux attach -t $SESSION -c ~
