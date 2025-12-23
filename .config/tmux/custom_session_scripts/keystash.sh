######################################################################
# KEYSTASH
#
# This script configures the terminal development environment used
# when working on the *Keystash* project.
#
#   https://github.com/raymondmwaura-osdev/KeyStash.git
#
# WINDOWS
#
# 1. run: This window provides a terminal connected to a virtual
#    environment that contains all required project dependencies.
#       index: 1
#       name: run
#       path: /mnt/data/Raymond/keystash
#
# 2. source editor: This window hosts the editor (nvim) used to modify
#    source files.
#       index: 2
#       name: src_nvim
#       path: /mnt/data/Raymond/keystash/src
#
# 3. src: This window provides a standard terminal in the source directory.
#    It is used for tasks other than running or editing files (for example,
#    using git).
#       index: 3
#       name: src
#       path: /mnt/data/Raymond/keystash/src
#
# 4. tests editor: This window hosts the editor (nvim) used to modify
#    unit tests.
#       index: 4
#       name: tests_nvim
#       path: /mnt/data/Raymond/keystash/tests
#
# 5. tests: This window provides a standard terminal in the tests directory.
#    It serves the same purpose as the ‘src’ window.
#       index: 5
#       name: tests
#       path: /mnt/data/Raymond/keystash/tests
######################################################################

SESSION="keystash"
KEYSTASH_DIR=/mnt/data/keystash

tmux has -t keystash 2> /dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION -n run -c $KEYSTASH_DIR
    tmux new-window -n src_nvim -t $SESSION -c $KEYSTASH_DIR/src nvim
    tmux new-window -n src -t $SESSION -c $KEYSTASH_DIR/src
    tmux new-window -n tests_nvim -t $SESSION -c $KEYSTASH_DIR/tests nvim
    tmux new-window -n tests -t $SESSION -c $KEYSTASH_DIR/tests
fi

tmux attach -t keystash -c ~ # Use `-c ~` to reset the default path where new sessions will be opened.
