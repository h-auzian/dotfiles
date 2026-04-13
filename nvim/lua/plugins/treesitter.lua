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
                disable = function(lang, bufnr)
                    return lang == "latex" or vim.api.nvim_buf_line_count(bufnr) > 10000
                end
            },
            indent = {
                enable = true,
            },
        })
    end,
}
