-- Highlight extra whitespace at the end of each line outside of insert mode.
vim.cmd("match TrailingWhitespace /\\s\\+$/")

vim.api.nvim_create_autocmd({"VimEnter", "InsertLeave"}, {
    callback = function()
        vim.cmd.hi("TrailingWhitespace ctermbg=red guibg=red")
    end,
    pattern = "*",
})

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.cmd.hi("clear TrailingWhitespace")
    end,
    pattern = "*",
})
