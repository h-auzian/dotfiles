# Assigns at runtime a new tmux keybind to switch to the currently active
# session, useful to "mark" it and quickly jump to it from any other session.
# The keybind will exist until the tmux server is killed.

# Receives as a parameter the key to which assign the keybind. The keybind
# itself will be set under a custom key-table to avoid conflicts with existing
# tmux keybinds. Thus, the resulting keybind will follow the sequence:
# <tmux-prefix> <custom-prefix> <key>

if [ $# -le 0 ]; then
    echo "Missing key parameter"
    exit 1
fi

key=$1
session_name=$(tmux display-message -p '#S')

tmux bind -T switch-session-prefix $key switch-client -t "$session_name"

exit 0
