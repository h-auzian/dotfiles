local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local side = "right" -- left|right
local always_visible = false

local quit_on_open
local update_focused_file
local keybind_command
local width

if (always_visible) then
    quit_on_open = false
    update_focused_file = true
    keybind_command = "NvimTreeFocus"
else
    quit_on_open = true
    update_focused_file = false
    keybind_command = "NvimTreeFindFileToggle"
end

if (side == "left") then
    width = 40
else
    width = 50
end

nvim_tree.setup({
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = update_focused_file,
    },
    view = {
        width = width,
        preserve_window_proportions = true,
        side = side,
        number = true,
        relativenumber = true,
        float = {
            enable = false,
            open_win_config = {
                width = 100,
                height = 100,
            }
        }
    },
    git = {
        enable = false,
        ignore = false,
    },
    actions = {
        open_file = {
            quit_on_open = quit_on_open
        }
    },
    filters = {
        custom = {
            "*.pyc",
            "__pycache__",
            "*.egg-info",
            ".pytest_cache",
        }
    }
})

vim.keymap.set("n", "<leader>f", ":" .. keybind_command .. "<CR>")
