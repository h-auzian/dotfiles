#!/bin/bash

# Script to be opened from rofi that lists and opens specific files, which are
# specified in an environment variable.
#
# If the script is executed without arguments, it outputs the list of files; if
# the script is executed with an argument, it tries to open that file, which
# must be opened in the background to avoid rofi to wait for keyboard input and
# freezing the whole window manager.

if [ $# -eq 0 ]; then
    if [ -f ~/.config/.bash_options ]; then
        source ~/.config/.bash_options
        options+=$ROFI_FILES
    fi
    printf "$options"
else
    coproc ( xdg-open $1 > /dev/null 2>&1 )
fi
