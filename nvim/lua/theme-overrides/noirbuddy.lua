colors = require("noirbuddy.colors").all()

-- Additional color definitions.
colors["blue"] = "#A0A0BA"
colors["green"] = "#A0BAA0"
colors["red"] = "#BAA0A0"
colors["yellow"] = "#BABAA0"
colors["cyan"] = "#A0BABA"
colors["black"] = "#101010"

colors["blue_bg"] = "#303035"
colors["green_bg"] = "#303530"
colors["red_bg"] = "#353030"
colors["yellow_bg"] = "#353530"
colors["cyan_bg"] = "#303535"

-- Custom code colors.
custom_highlight_colors = {
    noir_0 = {
        "@function",
        "@function.call",
    },
    noir_2 = {
        "@punctuation.delimiter",
        "@punctuation.bracket",
        "@operator",
    },
    noir_5 = {
        "@constant.builtin",
        "@type.builtin",
        "String",
    },
    noir_6 = {
        "@conditional",
        "@exception",
        "@include",
        "@keyword",
        "@keyword.return",
        "@keyword.function",
        "@namespace",
        "@repeat",
        -- "@type",
    },
    noir_7 = {
        "LineNr",
        "GitSignsCurrentLineBlame",
    }
}

for color, groups in pairs(custom_highlight_colors) do
    for _, group in pairs(groups) do
        vim.api.nvim_set_hl(0, group, { fg = colors[color] })
    end
end

-- Markview custom colors.
markview_custom_colors = {
    ["MarkviewCode"] = { bg = colors.blue_bg },
    ["MarkviewInlineCode"] = { bg = colors.blue_bg },
    ["MarkviewHeading1"] = { bg = colors.blue_bg },
    ["MarkviewHeading2"] = { bg = colors.green_bg },
    ["MarkviewHeading3"] = { bg = colors.red_bg },
    ["MarkviewHeading4"] = { bg = colors.yellow_bg },
    ["MarkviewHeading5"] = { bg = colors.cyan_bg },
    ["MarkviewGradient1"] = { fg = colors.noir_7 },
    ["MarkviewGradient2"] = { fg = colors.noir_7 },
    ["MarkviewGradient3"] = { fg = colors.noir_7 },
    ["MarkviewGradient4"] = { fg = colors.noir_7 },
    ["MarkviewGradient5"] = { fg = colors.noir_7 },
    ["MarkviewGradient6"] = { fg = colors.noir_7 },
    ["MarkviewGradient7"] = { fg = colors.noir_7 },
    ["MarkviewGradient8"] = { fg = colors.noir_7 },
    ["MarkviewGradient9"] = { fg = colors.noir_7 },
    ["MarkviewGradient10"] = { fg = colors.noir_7 },
    ["MarkviewListItemMinus"] = { fg = colors.noir_7 },
}

for key, value in pairs(markview_custom_colors) do
    vim.api.nvim_set_hl(0, key, value)
end

-- Neorg custom colors.
neorg_custom_colors = {
    ["headings.1"] = colors.blue,
    ["headings.2"] = colors.green,
    ["headings.3"] = colors.red,
    ["headings.4"] = colors.yellow,
    ["headings.5"] = colors.cyan,
    ["lists.ordered.prefix"] = colors.secondary,
    ["lists.unordered.prefix"] = colors.secondary,
    ["todo_items.undone"] = colors.blue,
    ["todo_items.pending"] = colors.yellow,
    ["todo_items.done"] = colors.green,
    ["todo_items.uncertain"] = colors.cyan,
    ["todo_items.cancelled"] = colors.red,
    ["todo_items.on_hold"] = colors.noir_7,
}

for key, value in pairs(neorg_custom_colors) do
    if string.find(key, "headings") then
        vim.api.nvim_set_hl(0, "@neorg." .. key .. ".prefix", { fg = value })
        vim.api.nvim_set_hl(0, "@neorg." .. key .. ".title", { fg = value })
    else
        vim.api.nvim_set_hl(0, "@neorg." .. key, { fg = value })
    end
end

-- Other colors.
vim.api.nvim_set_hl(0, "Search", { bg = colors.noir_7, fg = colors.noir_0 })

vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = colors.noir_8 })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.noir_8 })
vim.api.nvim_set_hl(0, "Normal", { fg = colors.noir_2 })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.noir_8 })

vim.api.nvim_set_hl(0, "FlashMatch", { fg = colors.primary })
vim.api.nvim_set_hl(0, "FlashCurrent", { fg = colors.primary })
vim.api.nvim_set_hl(0, "FlashLabel", { fg = colors.noir_0 })

vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.noir_6 })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.noir_0 })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.noir_3 })

vim.api.nvim_set_hl(0, "IndentBlankLineChar", { fg = colors.noir_8 })
vim.api.nvim_set_hl(0, "IndentBlankLineSpaceChar", { fg = colors.noir_1 })

vim.api.nvim_set_hl(0, "WinSeparator", { bg = nil, fg = colors.noir_8 })

-- Disable LSP semantic highlights.
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
