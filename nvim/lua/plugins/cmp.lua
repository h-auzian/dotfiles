return {
    "hrsh7th/nvim-cmp",
    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local function expand_next(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end

        local function expand_prev(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end

        -- Disable default keybinds in insert mode to avoid conflicts with the CMP keybinds.
        vim.keymap.set("i", "<C-j>", "")
        vim.keymap.set("i", "<C-l>", "")

        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-o>"] = cmp.mapping.confirm({ select = true }),
                ["<C-j>"] = cmp.mapping(expand_prev, { "i", "s" }),
                ["<C-l>"] = cmp.mapping(expand_next, { "i", "s" }),
            },
        }
    end,
}
