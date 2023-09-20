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
