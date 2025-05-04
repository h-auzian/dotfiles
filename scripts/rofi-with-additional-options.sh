#!/bin/bash

# Opens rofi with a list of applications plus additional options.

rofi -modes combi -show combi -combi-hide-mode-prefix -combi-modes "drun,Recent -:~/.config/scripts/rofi-open-file.sh"
