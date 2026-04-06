#!/bin/bash

# Script to be executed with a keyboard shortcut inside MPV media player.
# It saves the current video timestamp in a text file under a new line, useful
# to crop all listed videos using a FFmpeg script.

split_file=../split.txt

mode=$1
filename=$2
timestamp=$(echo $3 | cut -c 4-) # Remove the hour from the timestamp.

# If the file doesn't exist, create it with an empty line.
if [[ ! -f $split_file ]]; then
    echo "" > $split_file
fi

if [[ $mode == "start" || $mode == "end" ]]; then
    last_line=$(tail -n 1 $split_file)
    read -ra line_array <<< $last_line

    # First validate that the filenames are the same. Otherwise, create a new line.
    array_filename=${line_array[0]}
    if [[ -n $array_filename && $array_filename != $filename ]]; then
        echo "" >> $split_file
    fi

    # Replace the array values with the new parameters.
    if [[ $mode == "start" ]]; then
        line_array[0]=$filename
        line_array[1]=$timestamp
    elif [[ $mode == "end" ]]; then
        line_array[2]=$timestamp
    fi

    # Replace the last line.
    sed -i "\$c\\${line_array[0]} ${line_array[1]} ${line_array[2]}" $split_file

# If finishing, just insert a new empty line for the next video.
elif [[ $mode == "finish" ]]; then
    echo "" >> $split_file
fi
