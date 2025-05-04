#!/bin/bash

# Opens dmenu, but with additional entries in the list defined in an
# environment variable.

list=$(dmenu_path)"\n"

if [ -f ~/.config/.bash_options ]; then
    source ~/.config/.bash_options
    list+=$DMENU_ADDITIONAL_ENTRIES
fi

printf "$list" | dmenu "$@" | ${SHELL:-"/bin/sh"} &
