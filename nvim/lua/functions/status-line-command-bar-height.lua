-- Toggle status line height.
vim.api.nvim_create_user_command("ToggleStatusLineHeight", function()
    local value = vim.opt.laststatus._value

    if value == 0 then
        value = 2
    else
        value = 0
    end

    vim.opt.laststatus = value
end, {})

-- Toggle command bar height.
vim.api.nvim_create_user_command("ToggleCommandBarHeight", function()
    local value = vim.opt.cmdheight._value

    if value == 0 then
        value = 1
    else
        value = 0
    end

    vim.opt.cmdheight = value
end, {})
