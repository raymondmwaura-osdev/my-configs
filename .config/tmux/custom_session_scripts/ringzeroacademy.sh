#!/bin/bash

SESSION=ringzeroacademy
WORKING_DIR=/mnt/data/RingZeroAcademy/ringzeroacademy/design/tutorial_page

if ! tmux has-session -t $SESSION 2> /dev/null ; then
    tmux new -d -s $SESSION -c $WORKING_DIR
    tmux new-window -d -t $SESSION -c $WORKING_DIR nvim
fi

tmux attach -t $SESSION -c ~
