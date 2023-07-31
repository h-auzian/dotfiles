# Creates a new tmux session for a path selected either via fzf or passed as a
# parameter.

# Normally using alt+c with fzf lists all folders under the current working
# directory, but it usually takes several seconds. With this script, only an
# specific group of folders are shown, which are then passed to fzf to allow
# for a quick selection.

# This script works best while associated to a tmux keybind.

if [[ $# -eq 1 ]]; then
    selected_path=$1
else
    folders="/home/hans/Dropbox/\n"
    folders+="/home/hans/scripts/\n"
    folders+=$(find ~/Hans/Pega/ -mindepth 1 -maxdepth 1 -type d)"\n"
    folders+=$(find ~/Hans/Proyectos/Programación/ -mindepth 1 -maxdepth 2 -type d)"\n"
    selected_path=`printf "$folders" | fzf`
fi

if [[ -z $selected_path ]]; then
    exit 0
fi

parent_dir=$(basename $(dirname "$selected_path"))
selected_dir=$(basename "$selected_path")

if [[ $parent_dir != "hans" ]]; then
    session_name=`echo $parent_dir / $selected_dir`
else
    session_name=$selected_dir
fi

if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux switch-client -t "$session_name":0
else
    tmux switch-client -t "$session_name"
fi
