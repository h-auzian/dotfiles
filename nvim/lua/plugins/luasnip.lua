return {
    "L3MON4D3/LuaSnip",
    init = function ()
        local lua_loaders = require("luasnip.loaders.from_lua")
        lua_loaders.load({
            paths = "~/.config/nvim/lua/snippets/",
        })

        local luasnip = require("luasnip")
        luasnip.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        luasnip.filetype_extend("typescript", {"javascript"})
        luasnip.filetype_extend("typescriptreact", {"javascript"})
    end,
}
