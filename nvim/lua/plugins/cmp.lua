local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
	return
end

cmp.setup({
    mapping = {
        ["<C-l>"] = cmp.mapping.confirm({select = true}),
        ["<C-o>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.config.disable,
    }
})
