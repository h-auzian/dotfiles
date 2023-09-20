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
