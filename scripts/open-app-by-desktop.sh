# Opens an application depending of the current virtual desktop under KDE.
# This script works best while associated to a keyboard shortcut.

current_desktop=$(wmctrl -d | grep '*' | cut -d ' ' -f1)

if [ $current_desktop -eq 0 ]; then
    firefox
elif [ $current_desktop -eq 1 ]; then
    konsole
elif [ $current_desktop -eq 2 ]; then
    dolphin
elif [ $current_desktop -eq 3 ]; then
    dbeaver-ce
elif [ $current_desktop -eq 4 ]; then
    postman
elif [ $current_desktop -eq 5 ]; then
    slack
elif [ $current_desktop -eq 6 ]; then
    spotify
elif [ $current_desktop -eq 7 ]; then
    subl
fi
