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
