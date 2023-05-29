# Linux config

Config files for different tools while working under Linux, including:

- Tmux.
- Neovim.
- Lazygit, etc.

Plus aliases and personal scripts.

To load the bash options, add the following at the end of `.bashrc` file:

    if [ -f ~/.config/.bash_options ]; then
        . ~/.config/.bash_options
    fi
