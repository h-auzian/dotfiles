local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_lsp_zero or not status_lspconfig then
	return
end

lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

-- lsp_zero.on_attach(function(client, bufnr)
--     lsp_zero.default_keymaps({buffer = bufnr, preserve_mappings = true})
--     local opts = {buffer = bufnr, remap = false}
--     local k = vim.keymap
--     k.set("n", "<leader>d", ":lua vim.lsp.buf.definition()<CR>", opts)      -- Go to definition for selected symbol
--     k.set("n", "<leader>li", ":lua vim.diagnostic.goto_prev()<CR>", opts)   -- Go to previous diagnostic
--     k.set("n", "<leader>lk", ":lua vim.diagnostic.goto_next()<CR>", opts)   -- Go to next diagnostic
--     k.set("n", "<leader>lq", "<Plug>(toggle-lsp-diag)", opts)               -- Toggle diagnostics
--     k.set("n", "<leader>ls", "<Plug>(toggle-lsp-diag-vtext)", opts)         -- Toggle diagnostics text
--     k.set("n", "<leader>lff", ":LspZeroFormat<CR>", opts)                   -- Format current file
--     k.set("n", "<leader>le", ":lua vim.diagnostic.open_float()<CR>", opts)  -- Show diagnostics for current line
--     k.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)    -- Show actions for current line
--     k.set("n", "<leader>ld", ":Telescope diagnostics<CR>", opts)            -- Show diagnostics on Telescope
--     k.set("n", "<leader>lk", ":lua vim.lsp.buf.hover()<CR>", opts)          -- Show info of current symbol
--     k.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)         -- Rename current symbol
-- end)

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
                        -- "E301",
                        "E501", -- Line too long
                    }
                },
            }
        }
    }
})

lsp_zero.setup()
