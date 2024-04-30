# Assigns dynamically at runtime a new tmux keybind to run the tmux-fzf-session
# script to switch to the currently active session, useful to "mark" it and
# quickly jump to it from any other session. This keybind will also be saved on
# a file under the tmux config path, which can be loaded when tmux starts.
#
# Receives as a parameter the key to which assign the keybind. The keybind
# itself will be set under a custom key-table to avoid conflicts with existing
# tmux keybinds. Thus, the resulting keybind will follow the sequence:
# <tmux-prefix> <custom-prefix> <key>

if [ $# -le 0 ]; then
    echo "Missing key parameter"
    exit 1
fi
key=$1

# Set up the tmux bind comnand with the current working directory.
working_dir=$(tmux display-message -p '#{pane_current_path}')
bind_sub_command="bind -T switch-session-prefix $key"
bind_full_command="$bind_sub_command new-window ~/.config/scripts/tmux-fzf-session.sh $working_dir"

# Run the command to assign the keybind.
eval tmux $bind_full_command

# Write the command into a file, which should be loaded when tmux starts to
# persist the marks. If the file already contains a keybind for this key, the
# line will be replaced with the current working directory, otherwise the line
# will be appended at the end of the file.
filename="$HOME/.config/tmux/.session-binds.conf"
existing_bind_line=$(grep -n "$bind_sub_command" $filename | cut -d : -f 1)
if [ -n "$existing_bind_line" ]; then
    sed -i "${existing_bind_line}s:.*:${bind_full_command}:" "$filename"
else
    printf "$bind_full_command\n" >> $filename
fi
