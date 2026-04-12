#!/bin/bash

# Pipes to fzf a group of paths specified in the environment variables.

if [[ -f ~/.config/.bash_options ]]; then
    source ~/.config/.bash_options
fi
printf "$FZF_PATHS" | fzf
