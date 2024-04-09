return {
    "nvim-lualine/lualine.nvim",
    opts = function()
        local grapple = require("grapple")

        function GetGrappleKey()
            return " " .. grapple.name_or_index()
        end

        return {
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
                },
            },
        }
    end,
}
