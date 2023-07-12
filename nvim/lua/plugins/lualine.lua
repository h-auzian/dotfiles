local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

function GetGrappleKey()
    local key = require("grapple").key()
    return " " .. key
end

lualine.setup({
    options = {
        theme = "auto"
    },
    sections = {
        lualine_b = {
            "branch",
            "diagnostics",
        },
        lualine_c = {
            { "GetGrappleKey()", cond = require("grapple").exists },
            "filename",
        }
    }
})
