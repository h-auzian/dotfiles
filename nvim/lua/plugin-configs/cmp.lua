local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, luasnip = pcall(require, "luasnip")

if not cmp_status_ok or not luasnip_status_ok then
	return
end

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

cmp.setup({
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
})

-- Disable default keybinds in insert mode to avoid conflicts with the CMP keybinds.
vim.keymap.set("i", "<C-j>", "")
vim.keymap.set("i", "<C-l>", "")
