# Opens an application depending of the current virtual desktop/workspace in focus.
# This script works best while associated to a keyboard shortcut.

# If i3 is running, get currently focused workspace index.
# In this case, the index starts from 1, so it has to be adjusted to 0.
if pgrep -x "i3" > /dev/null; then
    curent_index=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).num')
    curent_index=$((curent_index - 1))

# Otherwise, if KDE is running, get currently focused virtual desktop index.
# In this case, the index starts from 0, so no adjustment is needed.
else
    curent_index=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
fi

if [ $curent_index -eq 0 ]; then
    firefox
elif [ $curent_index -eq 1 ]; then
    kitty
elif [ $curent_index -eq 2 ]; then
    kitty yazi
elif [ $curent_index -eq 3 ]; then
    dbeaver-ce
elif [ $curent_index -eq 4 ]; then
    postman
elif [ $curent_index -eq 5 ]; then
    firefox
elif [ $curent_index -eq 6 ]; then
    spotify
elif [ $curent_index -eq 7 ]; then
    firefox
elif [ $curent_index -eq 8 ]; then
    firefox
fi
