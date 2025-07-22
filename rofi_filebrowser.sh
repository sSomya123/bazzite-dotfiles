#!/bin/bash

# Default starting directory (can be changed)
START_DIR="${1:-$HOME}"
CURRENT_DIR="$START_DIR"

while true; do
    # Get a list of directory contents
    FILES=$(ls -a "$CURRENT_DIR")

    # Build menu options
    MENU=$(echo -e "../\n$FILES" | rofi -dmenu -i -p "$CURRENT_DIR" -theme-str 'window {width: 50%;}')

    # If user cancels
    [ -z "$MENU" ] && exit

    # If user chooses to go up
    if [[ "$MENU" == "../" ]]; then
        CURRENT_DIR=$(dirname "$CURRENT_DIR")
    # If it's a directory
    elif [ -d "$CURRENT_DIR/$MENU" ]; then
        CURRENT_DIR="$CURRENT_DIR/$MENU"
    # If it's a file
    elif [ -f "$CURRENT_DIR/$MENU" ]; then
        xdg-open "$CURRENT_DIR/$MENU" &
        exit
    fi
done

