return {
    "nvim-neorg/neorg",
    dependencies = {
        "luarocks.nvim",
    },
    lazy = false,
    version = "*",
    opts = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "norg",
            callback = function()
                local leader = "<localleader>"
                local opts = { buffer = true }

                vim.keymap.set("n", leader .. leader, ":Neorg toggle-concealer<CR>", opts)
                vim.keymap.set("n", leader .. "t", "<Plug>(neorg.pivot.list.toggle)", opts)
                vim.keymap.set("n", leader .. "a", "<Plug>(neorg.qol.todo-items.todo.task-undone)", opts)
                vim.keymap.set("n", leader .. "s", "<Plug>(neorg.qol.todo-items.todo.task-pending)", opts)
                vim.keymap.set("n", leader .. "d", "<Plug>(neorg.qol.todo-items.todo.task-done)", opts)
                vim.keymap.set("n", leader .. "q", "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)", opts)
                vim.keymap.set("n", leader .. "w", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", opts)
                vim.keymap.set("n", leader .. "e", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", opts)
            end
        })

        return {
            load = {
                ["core.defaults"] = {},
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
        }
    end
}
