-- Toggle character limit column
vim.api.nvim_create_user_command("ToggleColorColumn", function(opts)
    local o = vim.opt
    if o.colorcolumn._value == "" then
        o.colorcolumn = "80"
    else
        o.colorcolumn = ""
    end
end, {})
