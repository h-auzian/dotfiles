# Linux dotfiles

Dotfiles for different tools while working under Linux, including:

- Tmux.
- Neovim.
- Lazygit, etc.

Plus aliases and personal scripts.

![screenshot](https://github.com/HAuzian/dotfiles/assets/5781534/a959e077-f14c-4c85-aeb2-e0fc745887d3)

To load the bash options, add the following at the end of `.bashrc`:

    if [ -f ~/.config/.bash_options ]; then
        . ~/.config/.bash_options
    fi
