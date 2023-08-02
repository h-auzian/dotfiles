local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup({
    show_end_of_line = true,
    space_char_blankline = " ",
    use_treesitter = true,
    enabled = false
})
