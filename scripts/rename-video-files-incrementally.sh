#!/bin/bash

# Simple script to rename all video files from the current folder using an
# incremental counter.

commit="false"
if [[ $1 == "commit" ]]; then
    commit="true"
fi

counter=1
for file in *; do
    if [[ -f "$file" ]]; then
        ext="${file##*.}"
        if [[ "$ext" != "mp4" && "$ext" != "mkv" ]]; then
            continue
        fi

        printf -v new_name "%03d.%s" "$counter" "$ext"
        echo "$file --> $new_name"

        if [[ "$commit" == "true" ]]; then
            mv -n "$file" "$new_name"
        fi

        ((counter++))
    fi
done
