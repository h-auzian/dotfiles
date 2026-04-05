#!/bin/bash

# Calls fzf with a group of paths defined in a environment variable, and makes
# yazi go to the selected folder. Triggered using a keybind directly from yazi.

if [ -f ~/.config/.bash_options ]; then
    source ~/.config/.bash_options
fi
selected_path=$(printf "$FZF_PATHS" | fzf)

# If no path was selected with fzf, stop.
if [ -z $selected_path ]; then
    exit 0
fi

# Otherwise, make yazi go to the selected folder.
/snap/yazi/current/ya emit cd "$selected_path"
