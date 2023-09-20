-- Highlight extra whitespace at the end of each line in normal/visual mode,
-- plus additional related commands.
WhitespaceHighlightSet = false
WhitespaceHighlightEnabled = true
vim.cmd("match TrailingWhitespace /\\s\\+$/")

local function setHighlight()
    if WhitespaceHighlightEnabled then
        vim.cmd.hi("TrailingWhitespace ctermbg=red guibg=red")
        WhitespaceHighlightSet = true
    end
end

local function clearHighlight()
    vim.cmd.hi("clear TrailingWhitespace")
    WhitespaceHighlightSet = false
end

-- Highlight trailing whitespace while changing modes.
vim.api.nvim_create_autocmd({"VimEnter", "InsertLeave"}, {
    callback = setHighlight,
    pattern = "*",
})

-- Hide the highlight while entering insert mode.
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = clearHighlight,
    pattern = "*",
})

-- Toggle whitespace highlight.
vim.api.nvim_create_user_command("ToggleTrailingWhitespaceHighlight", function()
    WhitespaceHighlightEnabled = not WhitespaceHighlightEnabled
    if WhitespaceHighlightEnabled then
        setHighlight()
    else
        clearHighlight()
    end
end, {})

-- Clear all trailing whitespace in the current buffer.
vim.api.nvim_create_user_command("ClearBufferTrailingWhitespace", function()
    vim.cmd(":%s/\\s\\+$//e")
    vim.cmd("noh")
end, {})
