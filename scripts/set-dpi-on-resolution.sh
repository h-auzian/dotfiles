#!/bin/bash

# Detect current DPI from Xresources.
dpi_line=$(grep -n "dpi" "$HOME/.Xresources")

if [ -n "$dpi_line" ]; then
    if echo "$dpi_line" | grep -e "120" -q; then
        old_dpi="120"
        new_dpi="240"
    else
        old_dpi="240"
        new_dpi="120"
    fi
fi

# Get new DPI as parameter, if it exists.
if [ $# -ge 1 ]; then
    new_dpi=$1
fi

# Change DPI on relevant files.
declare -a files=(
    "$HOME/.Xresources"
    "$HOME/.config/polybar/bars/default.ini"
    "$HOME/.config/rofi/config.rasi"
)

for file in "${files[@]}"; do
    line=$(grep -n "dpi" "$file" | cut -d : -f 1)
    if [ -n "$line" ]; then
        sed -i "${line}s/${old_dpi}/${new_dpi}/" "$file"
    fi
done

# Reload relevant processes.
xrdb ~/.Xresources
polybar-msg cmd quit
i3-msg restart
$HOME/.config/scripts/wallpaper.sh
