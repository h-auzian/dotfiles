local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local grapple = require("grapple")

function GetGrappleKey()
    return " " .. grapple.name_or_index()
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
