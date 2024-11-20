-- Commands to set different TODO items in Markdown files.
--
-- For a list item that starts with a dash, it adds a square bracket box to
-- represent a TODO item.
--
-- For example:
--
-- - Original item without the box.
-- - [ ] TODO item with pending status.
-- - [/] TODO item with in progress status.
-- - [x] TODO item with done status, etc.
--
-- Works best with a Markdown previewer plugin, but it's not strictly
-- necessary.

local PATTERN = "- \\(\\[\\(\\| \\|-\\|x\\|/\\)\\] \\|\\)"

-- Sets the keybinds to apply the different TODO items on Markdown files.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local leader = "<localleader>"
        local opts = { buffer = true }

        vim.keymap.set("n", leader .. leader, ":Markview<CR>", opts)
        vim.keymap.set("n", leader .. "a", ":MarkdownSetTodoItem<CR>", opts)
        vim.keymap.set("n", leader .. "s", ":MarkdownSetTodoItem /<CR>", opts)
        vim.keymap.set("n", leader .. "d", ":MarkdownSetTodoItem x<CR>", opts)
        vim.keymap.set("n", leader .. "w", ":MarkdownSetTodoItem -<CR>", opts)
        vim.keymap.set("n", leader .. "q", ":MarkdownRemoveTodoItem<CR>", opts)
    end
})

-- Adds or replaces the square bracket box with the status received as
-- parameter. If no parameter was received, it assumes white space.
vim.api.nvim_create_user_command("MarkdownSetTodoItem", function(args)
    local status = args.args
    if (status == "") then
        status = " "
    end

    vim.cmd(":s:" .. PATTERN .. ":- \\[" .. status .. "\\] :e")
    vim.cmd("noh")
end, {
    nargs = "?",
})

-- Removes the square bracket box for this list item.
vim.api.nvim_create_user_command("MarkdownRemoveTodoItem", function(args)
    vim.cmd(":s:" .. PATTERN .. ":- :e")
    vim.cmd("noh")
end, {})
