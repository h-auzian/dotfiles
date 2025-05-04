#!/bin/bash

# Executes "feh" with a random image as a wallpaper while running i3.
# The wallpaper folder path is loaded from the environment variables.

if [ -f ~/.config/.bash_options ]; then
    source ~/.config/.bash_options
    feh --no-fehbg --bg-fill --randomize $WALLPAPER_FOLDER/*
fi
