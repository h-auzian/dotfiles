return {
    "nvim-neorg/neorg",
    dependencies = {
        "luarocks.nvim",
    },
    lazy = false,
    version = "*",
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.keybinds"] = {
                config = {
                    hook = function (keybinds)
                        local leader = keybinds.leader
                        keybinds.map("norg", "n", leader .. leader, ":Neorg toggle-concealer<CR>")
                        keybinds.remap_event("norg", "n", leader .. "a", "core.qol.todo_items.todo.task_undone")
                        keybinds.remap_event("norg", "n", leader .. "s", "core.qol.todo_items.todo.task_pending")
                        keybinds.remap_event("norg", "n", leader .. "d", "core.qol.todo_items.todo.task_done")
                        keybinds.remap_event("norg", "n", leader .. "q", "core.qol.todo_items.todo.task_ambiguous")
                        keybinds.remap_event("norg", "n", leader .. "w", "core.qol.todo_items.todo.task_cancelled")
                        keybinds.remap_event("norg", "n", leader .. "e", "core.qol.todo_items.todo.task_on_hold")
                    end
                },
            },
            ["core.concealer"] = {
                config = {
                    folds = true,
                    icons = {
                        code_block = {
                            conceal = true,
                            highlight = nil,
                            padding = {
                                left = 1,
                                right = 1,
                            },
                            width = "content",
                        },
                    },
                },
            },
        },
    },
}
