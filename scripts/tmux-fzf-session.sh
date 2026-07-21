#!/bin/bash

# Creates a new tmux session for a path selected either via fzf or passed as a
# parameter.
#
# Normally, using Alt+C with fzf installed lists all folders under the current
# working directory, but that can take several seconds depending on the
# directory. With this script, only an specific group of paths are passed to
# fzf, to allow for their quick selection regardless of the current working
# directory. The list of paths are read from an environment variable.

# Retrieve possible parameters.
total_windows=5
initial_window=1
session_name=''

if [ $# -ge 1 ]; then
    selected_path=$1

    if [ $# -ge 2 ]; then
        total_windows=$2
    fi

    if [ $# -ge 3 ]; then
        initial_window=$3
    fi

    if [ $# -ge 4 ]; then
        session_name=$4
    fi

# If no path was received as parameter, select the path using fzf.
else
    selected_path=$(~/.config/scripts/fzf-env-paths.sh)
fi

# If no path was selected with fzf, stop.
if [ -z $selected_path ]; then
    exit 0
fi

# If no session name was passed as parameter, define the name of the session
# using the name of the selected folder plus the name of its parent. If the
# parent folder is home, that is, the user's name, then just use the name of
# the selected folder without the parent.
if [ -z $session_name ]; then
    parent_dir=$(basename $(dirname "$selected_path"))
    selected_dir=$(basename "$selected_path")

    if [ $parent_dir != $USER ]; then
        session_name=$(echo $parent_dir / $selected_dir)
    else
        session_name=$selected_dir
    fi
fi

# Remove possible dots in the session name, as tmux doesn't allow their use.
# This can happen in paths such as ".config", ".ssh", and so on.
session_name=$(echo $session_name | tr -d .)

# If a session with said name doesn't exist, create it according to the
# received parameters.
if ! tmux has-session -t "=$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c "$selected_path"

    # Create the specified number of windows.
    for i in $(seq 2 $total_windows); do
        tmux new-window -t "$session_name" -c "$selected_path"
    done

    # Open applications on specific windows.
    tmux send-keys -t "$session_name":1 "nvim" C-m

    tmux send-keys -t "$session_name":4 "lazygit" C-m
    tmux rename-window -t "$session_name":4 "git"

    tmux send-keys -t "$session_name":5 "ttui" C-m
    tmux rename-window -t "$session_name":5 "tasks"

    # If the current path is mapped to a notes path, create an additional
    # window in that location.
    notes_location="$(~/.config/scripts/get-project-notes-path.sh $selected_path)"
    if [[ -n "$notes_location" ]]; then
        tmux new-window -t "$session_name" -c "$notes_location" -n "notes"
        tmux send-keys -t "$session_name":6 "nvim" C-m
    fi

    # Switch to the newly created session on the specified window.
    tmux switch-client -t "$session_name":$initial_window

# If the session already exists, then simply switch to it.
else
    tmux switch-client -t "$session_name"
fi
