local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local grapple = require("grapple")

function GetGrappleKey()
    local key = grapple.key()
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
            { "GetGrappleKey()", cond = grapple.exists },
            { "filename", path = 1 },
        }
    }
})
