return {
    "nvim-treesitter/nvim-treesitter",
    version = "0.9.2",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c",
                "cmake",
                "cpp",
                "glsl",
                "javascript",
                "lua",
                "norg",
                "php",
                "python",
                "sql",
                "vimdoc",
            },
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = false,
            },
        })
    end,
}
