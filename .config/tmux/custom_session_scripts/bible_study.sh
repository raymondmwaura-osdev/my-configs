#!/bin/bash

SESSION=bible_study
BIBLE_STUDY_DIR=/mnt/data/bible-study

GENESIS_DIR=/mnt/data/bible-study/books/01_Genesis
EXODUS_DIR=/mnt/data/bible-study/books/02_Exodus
CURRENT_BOOK_DIR=$EXODUS_DIR

if ! tmux has-session -t $SESSION 2> /dev/null; then
    tmux new-session -d -s $SESSION -n git -c $BIBLE_STUDY_DIR
    tmux new-window -d -n nvim -t $SESSION -c $CURRENT_BOOK_DIR nvim
fi

tmux attach -t $SESSION -c ~
