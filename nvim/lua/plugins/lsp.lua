return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "L3MON4D3/LuaSnip" },
    },
    opts = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.preset("recommended")

        local lspconfig = require("lspconfig")
        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    configurationSources = {"flake8"},
                    plugins = {
                        autopep8 = {
                            enabled = true,
                        },
                        pycodestyle = {
                            enabled = false,
                        },
                        mmcabe = {
                            enabled = false,
                        },
                        pyflakes = {
                            enabled = false,
                        },
                        flake8 = {
                            enabled = true,
                            ignore = {
                                "E124", -- Closing bracket does not match visual indentation
                                "E128", -- Continuation line under-indented for visual indent
                                "E501", -- Line too long
                            },
                        },
                        jedi_completion = {
                            enabled = true,
                            include_params = true,
                        },
                    },
                },
            },
        })

        return {}
    end
}
