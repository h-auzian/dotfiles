local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
	return
end

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }
})
