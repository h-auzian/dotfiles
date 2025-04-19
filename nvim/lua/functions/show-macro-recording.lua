-- Shows the command bar if a macro is being recorded.
vim.api.nvim_create_autocmd("RecordingEnter", {
    pattern = "*",
    callback = function()
        vim.opt.cmdheight = 1
    end
})

-- Hides the command bar if a macro has finished being recorded.
vim.api.nvim_create_autocmd("RecordingLeave", {
    pattern = "*",
    callback = function()
        vim.opt.cmdheight = 0
    end
})
