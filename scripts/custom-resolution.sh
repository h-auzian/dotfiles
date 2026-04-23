#!/bin/bash

# Allow for a custom resolution, useful for streaming the screen to a smaller
# device, like a tablet for reading.

type=$1
resolution="none"
if [[ $type == "vertical" ]]; then
    resolution="600 976"
elif [[ $type == "horizontal" ]]; then
    resolution="1024 551"
else
    echo "Please pass 'vertical' or 'horizontal' for the custom resolution"
    exit 0
fi

full_modeline=$(cvt $resolution 30 | grep -o "\b\s\".*")
mode=$(echo $full_modeline | grep -Po "\d+x\d+_\d+.\d+")
options=$(echo $full_modeline | grep -Po " \d.*")

xrandr --newmode "$mode" $options
xrandr --addmode HDMI-1 $mode
xrandr --output HDMI-1 --primary --mode $mode
