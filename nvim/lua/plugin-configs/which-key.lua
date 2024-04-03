local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

which_key.setup()

which_key.register({

    ["<leader>"] = {
        mode = { "n", "x" },

        s = { ":w<CR>", "Save current buffer" },
        w = { ":bw<CR>", "Close current buffer" },
        j = { "<C-6>", "Jump to last buffer" },
        d = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition for selected symbol" },
        h = { ":ClangdSwitchSourceHeader<CR>", "Switch header/implementation" },
        i = { ":ToggleAlternate<CR>", "Toggle alternate on current symbol" },
        f = { ":NvimTreeFindFileToggle<CR>", "Open NvimTree" },

        p = {
            name = "Buffer navigation / Search",
            q = { ":Telescope session-lens search_session<CR>", "Switch session" },
            d = { ":Telescope find_files hidden=true no_ignore=true<CR>", "Open buffer" },
            e = { ":Telescope lsp_document_symbols<CR>", "Search symbols" },
            r = { ":Telescope treesitter default_text=function<CR>", "Search functions" },
            f = { ":Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
            g = { ":Telescope live_grep hidden=true<CR>", "Find on all files" },
            s = { ":Telescope grep_string hidden=true<CR>", "Find word" },
            w = { ":Telescope buffers sort_mru=true<CR>", "List open buffers" },
            c = { ":Telescope help_tags<CR>", "Show help" },
            a = { ":Telescope resume<CR>", "Resume last search" },
            h = { ":ClangdSwitchSourceHeader<CR>", "Switch header/implementation" },
        },

        l = {
            name = "LSP",
            i = { ":lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
            k = { ":lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
            q = { "<Plug>(toggle-lsp-diag)", "Toggle diagnostics" },
            s = { "<Plug>(toggle-lsp-diag-vtext)", "Toggle diagnostics text" },
            t = { ":LspZeroFormat<CR>", "Format current buffer" },
            e = { ":lua vim.diagnostic.open_float()<CR>", "Show diagnostics for current line" },
            a = { ":lua vim.lsp.buf.code_action()<CR>", "Show actions for current line" },
            l = { ":lua vim.lsp.buf.hover()<CR>", "Show info of current symbol" },
            r = { ":lua vim.lsp.buf.rename()<CR>", "Rename current symbol" },
            f = { ":Telescope lsp_references<CR>", "Show references for selected symbol" },
            w = { ":Telescope diagnostics<CR>", "Show all diagnostics" },
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
            name = "Splits",

            ["-"] = { ":split<CR>", "New horizontal split" },
            ["|"] = { ":vsplit<CR>", "New vertical split" },

            a = { ":CenterBuffer<CR>", "Center current buffer" },

            i = { "<C-w>k", "Go up" },
            j = { "<C-w>h", "Go left" },
            k = { "<C-w>j", "Go down" },
            l = { "<C-w>l", "Go right" },

            I = { "<C-w>k<C-w>_", "Go up and maximize" },
            J = { "<C-w>h<C-w>|", "Go left and maximize" },
            K = { "<C-w>j<C-w>_", "Go down and maximize" },
            L = { "<C-w>l<C-w>|", "Go right and maximize" },

            w = { ":close<CR>", "Close split" },
            s = { ":wincmd r<CR>", "Swap buffers" },

            r = {
                name = "Resize splits",
                i = { ":resize +3<CR>", "Decrease height" },
                k = { ":resize -3<CR>", "Increase height" },
                j = { ":vertical resize -10<CR>", "Decrease width" },
                l = { ":vertical resize +10<CR>", "Increase width" },
                r = { "<C-W>=", "Restore size" },
                ["|"] = { "<C-w>|", "Maximize vertical split" },
                ["-"] = { "<C-w>_", "Maximize horizontal split" },
            },

            d = {
                name = "Change splits",
                ["-"] = { ":wincmd J<CR>", "Change to horizontal" },
                ["|"] = { ":wincmd H<CR>", "Change to vertical" },
            },
        },

        r = {
            name = "Replace",
            f = { "/", "Highlight text" },
            r = { "cgn", "Replace current Highlight" },
            a = { ":noh<CR>", "Clear highlight" },
            h = { ":%s/", "Replace all on current buffer" },
        },

        b = {
            name = "Base64",
            e = { ":lua require('b64').encode()<CR>", "Encode selection" },
            d = { ":lua require('b64').decode()<CR>", "Decode selection" },
        },

        k = {
            name = "JSON",
            k = { ":%!jq '.'<CR><CR>", "Beautify JSON" },
            l = { ":%!jq '.' -c<CR><CR>", "Minify JSON" },
            d = { ":%!jq '. | {}'<left><left>", "Filter JSON object" },
            f = { ":%!jq '[.[] | {}]'<left><left><left>", "Filter JSON list" },
        },

        q = {
            name = "Misc",
            n = { ":enew<CR>", "Open buffer without file" },
            l = { ":set wrap!<CR>", "Toggle line wrap" },
            s = { ":ToggleColorColumn<CR>", "Toggle color column" },
            k = { ":ToggleCommandHeight<CR>", "Toggle command height" },
            a = { ":%bw|e#<CR>", "Close all buffers" },
            j = { ":set list!<CR>", "Toggle list chars" },
            i = { ":IndentBlanklineToggle!<CR>", "Toggle indentation lines" },
            p = { ":lua require('duck').hatch('🐤')<CR>", "Duck" },
            P = { ":lua require('duck').cook()<CR>", "Cook Duck" },
            o = { ":ToggleTrailingWhitespaceHighlight<CR>", "Toggle trailing whitespace highlight" },
            O = { ":ClearBufferTrailingWhitespace<CR>", "Clear trailing whitespace on current buffer" },
            w = {
                name = "Close buffer without saving",
                w = { ":bw!<CR>", "Confirm" },
            },
        },

        c = {
            name = "Copy",
            y = { "gg0vG$y<C-o>", "Yank whole buffer" },
            l = { "_v$hygv<esc>", "Yank whole line without starting/ending whitespace" },
            r = { ":let @+ = expand('%:.')<CR>", "Copy relative path to clipboard", },
            f = { ":let @+ = expand('%:t')<CR>", "Copy filename to clipboard", },
            c = { ":redir @+ | pwd | redir END | let @+ = substitute(@+, '\\n', '', 'g')<CR><ESC>", "Copy current working directory to clipboard" },
        },
    },
})
