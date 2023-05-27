local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

which_key.setup()

which_key.register({

    ["<leader>"] = {
        mode = { "n", "v" },

        s = { ":w<CR>", "Save current buffer" },
        w = { ":bw<CR>", "Close current buffer" },

        d = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition for selected symbol" },

        f = { ":NvimTreeFindFileToggle<CR>", "Toggle sidebar" },
        ["|"] = { ":NvimTreeFindFileToggle<CR>", "Toggle sidebar" },

        p = {
            name = "Telescope",
            q = { ":Telescope session-lens search_session<CR>", "Switch session" },
            d = { ":Telescope find_files hidden=true no_ignore=true<CR>", "Open buffer" },
            e = { ":Telescope treesitter default_text=function<CR>", "Search functions" },
            f = { ":Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
            g = { ":Telescope live_grep hidden=true<CR>", "Find on all files" },
            s = { ":Telescope grep_string hidden=true<CR>", "Find word" },
            w = { ":Telescope buffers<CR>", "List open buffers" },
            c = { ":Telescope help_tags<CR>", "Show help" },
        },

        l = {
            name = "LSP",
            i = { ":lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
            k = { ":lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
            q = { "<Plug>(toggle-lsp-diag)", "Toggle diagnostics" },
            s = { "<Plug>(toggle-lsp-diag-vtext)", "Toggle diagnostics text" },
            t = { ":LspZeroFormat<CR>", "Format current file" },
            e = { ":lua vim.diagnostic.open_float()<CR>", "Show diagnostics for current line" },
            a = { ":lua vim.lsp.buf.code_action()<CR>", "Show actions for current line" },
            h = { ":lua vim.lsp.buf.hover()<CR>", "Show info of current symbol" },
            r = { ":lua vim.lsp.buf.rename()<CR>", "Rename current symbol" },
            f = { ":Telescope lsp_references<CR>", "Show references for selected symbol" },
            d = { ":Telescope diagnostics<CR>", "Show all diagnostics" },
        },

        e = {
            name = "Folding",
            e = { "za", "Toggle current fold" },
            i = { "zc", "Close current fold" },
            k = { "zO", "Open current fold" },
            f = { ":let &l:foldlevel = indent('.') / &shiftwidth<CR>", "Fold current level" },
            a = { ":lua require('ufo').openAllFolds()<CR>", "Open all folds" },
            c = { ":lua require('ufo').closeAllFolds()<CR>", "Close all folds" },
        },

        a = {
            name = "Split",
            -- r = { ":lua require('smart-splits').start_resize_mode()<CR>", "Resize" },
            i = { "<C-w>k", "Go up" },
            j = { "<C-w>h", "Go left" },
            k = { "<C-w>j", "Go down" },
            l = { "<C-w>l", "Go right" },
            -- w = { ":resize +5<CR>", "Decrease height" },
            -- a = { ":vertical resize -10<CR>", "Go down" },
            -- s = { ":resize -5<CR>", "Increase height" },
            -- d = { ":vertical resize +10<CR>", "Go right" },
            ["|"] = { ":vsplit<CR>", "New vertical split" },
            ["-"] = { ":split<CR>", "New horizontal split" },
            ["="] = { "<C-W>=", "Restore size" },
        },

        r = {
            name = "Replace",
            f = { "/", "Highlight text" },
            r = { "cgn", "Replace current Highlight" },
            a = { ":noh<CR>", "Clear highlight" },
            h = { ":%s/", "Replace all on current buffer" },
        },

        ["ñ"] = {
            name = "harpoon",
              a   = { ":lua require('harpoon.mark').add_file()<CR>", "Mark current file" },
              w   = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Show marked files" },
              d   = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Show marked files" },
              j   = { ":lua require('harpoon.ui').nav_file(1)<CR>", "Go to file 1" },
              k   = { ":lua require('harpoon.ui').nav_file(2)<CR>", "Go to file 2" },
              l   = { ":lua require('harpoon.ui').nav_file(3)<CR>", "Go to file 3" },
            ["ñ"] = { ":lua require('harpoon.ui').nav_file(4)<CR>", "Go to file 4" },
              u   = { ":lua require('harpoon.ui').nav_file(5)<CR>", "Go to file 5" },
              i   = { ":lua require('harpoon.ui').nav_file(6)<CR>", "Go to file 6" },
              o   = { ":lua require('harpoon.ui').nav_file(7)<CR>", "Go to file 6" },
              p   = { ":lua require('harpoon.ui').nav_file(8)<CR>", "Go to file 6" },
              c   = { ":lua require('harpoon.mark').clear_all()<CR>", "Remove all marks" },
        },

        b = {
            name = "Base64",
            e = { ":lua require('b64').encode()<CR>", "Encode selection" },
            d = { ":lua require('b64').decode()<CR>", "Decode selection" },
        },

        q = {
            name = "Misc",
            n = { ":enew<CR>", "Open buffer without file" },
            l = { ":set wrap!<CR>", "Toggle line wrap" },
            s = { ":ToggleColorColumn<CR>", "Toggle color column" },
            a = { ":%bw|e#<CR>", "Close all buffers" },
            w = {
                name = "Close buffer without saving",
                w = { ":bw!<CR>", "Confirm" },
            },
        },

        c = {
            name = "Copy",
            c = {
                ":redir @+ | pwd | redir END | let @+ = substitute(@+, '\\n', '', 'g')<CR>",
                "Copy current working directory to clipboard"
            },
            -- s = {
            --     ":redir @+ | pwd | redir END | let @+ = substitute(@+, '.*\/', '', 'g')<CR>",
            --     "Copy current working directory to clipboard"
            -- },
        },
    },
})
