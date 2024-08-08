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
                "go",
                "javascript",
                "lua",
                "norg",
                "php",
                "python",
                "sql",
                "tsx",
                "typescript",
                "vimdoc",
            },
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
