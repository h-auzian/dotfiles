-- Toggle character limit column.
vim.api.nvim_create_user_command("ToggleColorColumn", function()
    local value = vim.opt.colorcolumn._value
    if value == "" then
        value = "80"
    else
        value = ""
    end
    vim.opt.colorcolumn = value
end, {})

-- Toggle command line height.
vim.api.nvim_create_user_command("ToggleCommandHeight", function()
    local value = vim.opt.cmdheight._value
    if value == 0 then
        value = 1
    else
        value = 0
    end
    vim.opt.cmdheight = value
end, {})

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
