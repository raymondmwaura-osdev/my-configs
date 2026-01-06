# Set up tmux environment for learning manim.
SESSION=manim
MANIM_DIR=/mnt/data/python-notes-and-insights/manim

keystash has -t manim 2> /dev/null
if [[ $? != 0 ]]; then
    tmux new-session -d -s $SESSION -c $MANIM_DIR -n run
    tmux send-keys -t ${SESSION}:run "source venv/bin/activate" Enter
    tmux new-window -d -t $SESSION -c $MANIM_DIR -n docs nvim
    tmux new-window -d -t $SESSION -c $MANIM_DIR -n code nvim
fi

tmux attach -t $SESSION -c ~ # Use `-c ~` to reset the directory where new windows will be opened.
