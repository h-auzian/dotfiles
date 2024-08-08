return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    lazy = false,
    opts = function()
        local actions = require("telescope.actions")
        return {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["jk"] = actions.close,
                        ["<C-i>"] = actions.move_selection_previous,
                        ["<C-k>"] = actions.move_selection_next,
                    },
                },
                file_ignore_patterns = {
                    ".angular",
                    ".git/",
                    ".pyc",
                    ".pytest_cache/",
                    "__pycache__",
                    "mysql/",
                    "env/",
                    "htmlcov/",
                    "node_modules/",
                    "vendor",
                    "include",
                    "libs",
                },
            },
            pickers = {
                buffers = {
                    sort_lastused = true
                },
            },
        }
    end,
}
