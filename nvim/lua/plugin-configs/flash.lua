local status_ok, flash = pcall(require, "flash")
if not status_ok then
	return
end

flash.setup({
    search = {
        exclude = {
            "notify",
            "cmp_menu",
            "noice",
            "flash_prompt",
            "nvimtree",
        },
    },
    modes = {
        search = {
            enabled = false,
        }
    },
})

vim.api.nvim_set_hl(0, 'FlashMatch', { fg = 'green' })
vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = 'red' })
vim.api.nvim_set_hl(0, 'FlashLabel', { fg = 'white' })

vim.keymap.set({"n", "x"}, "s", function() require("flash").jump() end)
