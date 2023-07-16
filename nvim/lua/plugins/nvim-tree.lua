local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    view = {
        width = 50,
        preserve_window_proportions = true,
        side = "right",
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
            quit_on_open = false
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
