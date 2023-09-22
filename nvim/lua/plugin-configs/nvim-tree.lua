local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

WIDTH_SCALE = 0.4
HEIGHT_SCALE = 0.8
COMMAND_BAR_COMPENSATION = 1

-- Returns the settings so that the floating window appears centered on screen.
-- This function is passed to the setup function instead of passing static
-- values, so that the window appears centered even after changing the terminal
-- and/or the font size without the need of restarting neovim.
local function getCenteredWindowOptions()
    local screen_width = vim.opt.columns:get()
    local screen_height = vim.opt.lines:get() - vim.opt.cmdheight:get()
    local window_width = math.floor(screen_width * WIDTH_SCALE)
    local window_height = math.floor(screen_height * HEIGHT_SCALE)
    local window_left = (screen_width - window_width) / 2
    local window_top = ((vim.opt.lines:get() - window_height) / 2) - vim.opt.cmdheight:get()

    return {
        border = "rounded",
        relative = "editor",
        row = window_top - COMMAND_BAR_COMPENSATION,
        col = window_left,
        width = window_width,
        height = window_height,
    }
end

nvim_tree.setup({
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    view = {
        number = true,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = getCenteredWindowOptions,
        },
    },
    git = {
        enable = false,
        ignore = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        custom = {
            "*.pyc",
            "__pycache__",
            "*.egg-info",
            ".pytest_cache",
        },
    },
})
