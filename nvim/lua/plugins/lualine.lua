local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
    options = {
        theme = "auto"
    },
    sections = {
        lualine_b = {
            {
                function ()
                    local key = require("grapple").key()
                    return " " .. key
                end,
                cond = require("grapple").exists,
            }
        }
    }
})
