local status_ok, material = pcall(require, "material")
if not status_ok then
	return
end

material.setup({
    -- lualine_style = "stealth"
})
