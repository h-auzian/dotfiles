# Creates a new tmux session for a path selected either via fzf or passed as a
# parameter.

# First, define a list of paths to pass to fzf, and then get the name of the
# selected path. Normally using alt+c with fzf lists all folders under the
# current working directory, but that usually takes several seconds. In this
# case, only an specific group of paths are selected, which are then passed
# to fzf to allow for their quick selection.
if [ $# -eq 1 ]; then
    selected_path=$1
else
    folders="/home/hans/Dropbox/\n"
    folders+="/home/hans/.config/scripts/\n"
    folders+=$(find ~/Hans/Pega/ -mindepth 1 -maxdepth 3 -type d)"\n"
    folders+=$(find ~/Hans/Proyectos/Programación/ -mindepth 1 -maxdepth 2 -type d)"\n"
    selected_path=`printf "$folders" | fzf`
fi

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

# If a session with said name doesn't exists, create a new tmux session with
# four windows, open nvim in the first one, and then switch to said session.
# If the session already exists, then simply switch to it without creating
# anything.
if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux send-keys -t "$session_name":1 'nvim' Enter
    tmux switch-client -t "$session_name":1
else
    tmux switch-client -t "$session_name"
fi
