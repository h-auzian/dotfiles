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
total_windows=4
initial_window=1

if [ $# -ge 1 ]; then
    selected_path=$1

    if [ $# -ge 2 ]; then
        total_windows=$2
    fi

    if [ $# -ge 3 ]; then
        initial_window=$3
    fi

# If no path was received as parameter, pass to fzf the folders defined in an
# environment variable and then get the name of the selected path.
else
    # Try to reload the environment variables to avoid the need to restart the
    # terminal and tmux when running this script with a tmux keybind.
    if [ -f ~/.config/.bash_options ]; then
        source ~/.config/.bash_options
    fi

    selected_path=`printf "$TMUX_FZF_SESSION_PATHS" | fzf`
fi

# If no path was selected with fzf, stop.
if [ -z $selected_path ]; then
    exit 0
fi

# Define the name of the session using the name of the selected folder plus the
# name of its parent. If the parent folder is home, that is, the user name,
# then just use the name of the selected folder.
parent_dir=$(basename $(dirname "$selected_path"))
selected_dir=$(basename "$selected_path")

if [ $parent_dir != $USER ]; then
    session_name=`echo $parent_dir / $selected_dir`
else
    session_name=$selected_dir
fi

# Remove possible dots in the session name, as tmux doesn't allow their use.
# This can happen in paths such as ".config", ".ssh", and so on.
session_name=$(echo $session_name | tr -d .)

# If a session with said name doesn't exist, create it according to the
# received parameters.
if ! tmux has-session -t="$session_name" 2> /dev/null; then

    # Create the session.
    tmux new-session -ds "$session_name" -c $selected_path

    # Create the specified number of windows.
    for i in $(seq 2 $total_windows); do
        tmux new-window -t "$session_name" -c $selected_path
    done

    # Open nvim on the first window.
    tmux send-keys -t "$session_name":1 'nvim' Enter

    # Switch to the newly created session on the specified window.
    tmux switch-client -t "$session_name":$initial_window

# If the session already exists, then simply switch to it.
else
    tmux switch-client -t "$session_name"
fi
