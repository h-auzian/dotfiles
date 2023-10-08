-- Invokes centerpad plugin, but with custom parameters.
local centerpad = require("centerpad")
PADDING = 20

vim.api.nvim_create_user_command("CenterBuffer", function()
    centerpad.toggle({
        leftpad = PADDING,
        rightpad = PADDING,
    })
end, {})
