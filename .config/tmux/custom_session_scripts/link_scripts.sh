#!/usr/bin/env sh

# -e: Exit on error.
# -u: Treat unset variables as an error.
set -eu

SRC_DIR="${1:-.}" # Command line argument, or current working directory if not given.
DEST_DIR="$HOME/.local/bin"

mkdir -p "$DEST_DIR" # Create parent directories. No error if directory exists.

find "$SRC_DIR" -maxdepth 1 -type f -name '*.sh' | while IFS= read -r script; do
    base=$(basename "$script" .sh) # Remove '.sh' extension.
    ln -f "$script" "$DEST_DIR/$base"
    echo "$script hard linked to $DEST_DIR/$base"
done
