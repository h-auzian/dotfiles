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
    config = function(_, opts)
        -- Lualine overrides "laststatus" config option on setup. As a
        -- workaround, the value is stored before setup and set again
        -- afterwards.
        local laststatus = vim.opt.laststatus._value
        require("lualine").setup(opts)
        vim.opt.laststatus = laststatus
    end,
}
