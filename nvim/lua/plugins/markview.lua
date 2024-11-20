return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        headings = {
            shift_width = 1,
            heading_1 = {
                sign = "",
                style = "icon",
            },
            heading_2 = {
                sign = "",
                style = "icon",
            },
            heading_3 = {
                sign = "",
                style = "icon",
            },
        },
        list_items = {
            indent_size = 4,
            shift_width = 2,
        },
        code_blocks = {
            style = "minimal",
            pad_amount = 2,
            sign = false,
        },
    }
}
