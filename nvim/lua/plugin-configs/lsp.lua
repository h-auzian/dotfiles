local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_lsp_zero or not status_lspconfig then
	return
end

lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

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
                    }
                },
                jedi_completion = {
                    enabled = true,
                    include_params = true,
                },
            }
        }
    }
})

lsp_zero.setup()
