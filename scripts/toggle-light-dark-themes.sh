# Makes changes in several config files to switch between light and dark modes.
# It reads the tmux config as reference to detect the current mode, and then
# changes the rest of the config files accordingly.
dark_theme="dark"
dark_color_scheme="Breeze 5"
dark_flash_highlight="white"

light_theme="light"
light_color_scheme="Solarized Light 2"
light_flash_highlight="blue"

tmux_file="$HOME/.config/tmux/configs/options.conf"
nvim_options_file="$HOME/.config/nvim/lua/options.lua"
nvim_flash_file="$HOME/.config/nvim/lua/plugin-configs/flash.lua"
konsole_file="$HOME/.local/share/konsole/Profile 1.profile"

# Detect current theme mode in the tmux config.
tmux_theme=$(grep -n "theme-overrides" "$tmux_file")
if [ -n "$tmux_theme" ]; then
    if echo "$tmux_theme" | grep -e "dark" -q; then
        old_theme=$dark_theme
        new_theme=$light_theme
        old_color_scheme=$dark_color_scheme
        new_color_scheme=$light_color_scheme
        old_flash_highlight=$dark_flash_highlight
        new_flash_highlight=$light_flash_highlight
    else
        old_theme=$light_theme
        new_theme=$dark_theme
        old_color_scheme=$light_color_scheme
        new_color_scheme=$dark_color_scheme
        old_flash_highlight=$light_flash_highlight
        new_flash_highlight=$dark_flash_highlight
    fi
fi

# Apply changes in tmux config.
tmux_theme_line=$(grep -n "theme-overrides" "$tmux_file" | cut -d : -f 1)
if [ -n "$tmux_theme_line" ]; then
    sed -i "${tmux_theme_line}s/${old_theme}/${new_theme}/" "$tmux_file"
fi

# Apply changes in nvim config.
nvim_background_line=$(grep -n "o.background" "$nvim_options_file" | cut -d : -f 1)
if [ -n "$nvim_background_line" ]; then
    sed -i "${nvim_background_line}s/${old_theme}/${new_theme}/" "$nvim_options_file"
fi

nvim_color_hightlight_line=$(grep -n "FlashLabel" "$nvim_flash_file" | cut -d : -f 1)
if [ -n "$nvim_color_hightlight_line" ]; then
    sed -i "${nvim_color_hightlight_line}s/${old_flash_highlight}/${new_flash_highlight}/" "$nvim_flash_file"
fi

# Apply changes in konsole config.
color_scheme_line=$(grep -n "ColorScheme=" "$konsole_file" | cut -d : -f 1)
if [ -n "$color_scheme_line" ]; then
    sed -i "${color_scheme_line}s/${old_color_scheme}/${new_color_scheme}/" "$konsole_file"
fi
