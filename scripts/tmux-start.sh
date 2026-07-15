#!/bin/bash

# Starts tmux with a "home" session with pre-defined windows.

session_name="home"
if tmux has-session -t "=$session_name" 2> /dev/null; then
    exit
fi

tmux new -d -s "$session_name"
tmux new-window -d -t "$session_name"
tmux new-window -d -t "$session_name"
tmux new-window -d -t "$session_name"
tmux new-window -d -t "$session_name" -n "tasks"
tmux send-keys -t "$session_name":5 "ttui" C-m

tmux attach-session -t "$session_name"
