local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({

	defaults = {

		mappings = {
			i = {
				["<esc>"] = actions.close,
                ["jk"] = actions.close,
				["<C-i>"] = actions.move_selection_previous,
				["<C-k>"] = actions.move_selection_next,
			}
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
            "vendor"
		}
	}
})
