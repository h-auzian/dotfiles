#!/bin/bash

# Helper script to toggle between different i3 "modes", which are just
# different i3/polybar configurations.

mode=$1

if [[ $mode == "centered" ]]; then
    polybar_bar_name="centered"
    polybar_bar_color="background"
    i3_gaps_inner_prefix=""
    i3_gaps_bottom_prefix=""
    picom_corner_radius_prefix=""
elif [[ $mode == "polybar-full" ]]; then
    polybar_bar_name="full"
    polybar_bar_color="background"
    i3_gaps_inner_prefix=""
    i3_gaps_bottom_prefix="# "
    picom_corner_radius_prefix=""
elif [[ $mode == "i3-full" ]]; then
    polybar_bar_name="full"
    polybar_bar_color="background-alt"
    i3_gaps_inner_prefix="# "
    i3_gaps_bottom_prefix="# "
    picom_corner_radius_prefix="# "
else
    echo "Please specify a mode"
    exit
fi

# Polybar:
file="$HOME/.config/polybar/config.ini"
line_number=$(grep -m 1 -n ".bars/" "$file" | cut -d : -f 1)
if [[ -n "$line_number" ]]; then
    sed -i "${line_number}c\include-file = ./bars/${polybar_bar_name}.ini" "$file"
fi

file="$HOME/.config/polybar/bars/common/bar-settings.ini"
line_number=$(grep -m 1 -n "background =" "$file" | cut -d : -f 1)
if [[ -n "$line_number" ]]; then
    sed -i "${line_number}c\background = \$\{colors.${polybar_bar_color}\}" "$file"
fi

# i3:
file="$HOME/.config/i3/options.conf"
line_number=$(grep -m 1 -n "gaps inner" "$file" | cut -d : -f 1)
if [[ -n "$line_number" ]]; then
    sed -i "${line_number}s/^.*gaps inner/${i3_gaps_inner_prefix}gaps inner/" "$file"
fi

line_number=$(grep -m 1 -n "gaps bottom" "$file" | cut -d : -f 1)
if [[ -n "$line_number" ]]; then
    sed -i "${line_number}s/^.*gaps bottom/${i3_gaps_bottom_prefix}gaps bottom/" "$file"
fi

i3-msg reload -q

# Picom:
file="$HOME/.config/picom.conf"
line_number=$(grep -m 1 -n "corner-radius" "$file" | cut -d : -f 1)
if [[ -n "$line_number" ]]; then
    sed -i "${line_number}s/^.*corner-radius/${picom_corner_radius_prefix}corner-radius/" "$file"
fi
