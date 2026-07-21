#!/bin/bash

# Utility script that receives a project's path as input, and returns a new
# path that contains that project's notes, if it exists, as I prefer to have
# the project's notes in a different location.
#
# The notes path is defined in an env variable. That path contains many
# subfolders, one per project, and each subfolder has the notes in plain
# markdown files.
#
# The notes path also contains a ".paths" file, which maps each project path
# with their respective notes subfolder. For example, "~/projects/my-project",
# could be mapped to "<notes-path>/my-project". Basically, this script receives
# the first path and returns the second one, useful to open the notes path in a
# new tmux window next to the actual project path in the same session.

if [[ -z "$1" ]]; then
    exit
fi

# Check if the project notes file exists, otherwise exit.
if [[ -f ~/.config/.bash_options ]]; then
    source ~/.config/.bash_options
fi

notes_location="$PROJECT_NOTES_PATH"
paths_file="$notes_location/.paths"

if [[ ! -f $paths_file ]]; then
    exit
fi

# Trim the received file path into the last two subfolders, to avoid making the
# search too specific.
full_path=$1
current_dir=$(basename "$full_path")
parent_dir=$(basename $(dirname "$full_path"))
path_to_search=$parent_dir/$current_dir

# Find the path in the file. If found, find and return the subfolder that
# contains the project's notes.
search_result=$(grep "$path_to_search" "$paths_file")
if [[ -n "$search_result" ]]; then
    read -ra line_array <<< "$search_result"
    notes_subfolder="${line_array[1]}"
    echo "$notes_location/$notes_subfolder"
fi
