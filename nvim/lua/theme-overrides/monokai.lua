local monokai = require("monokai")
local palette = monokai.classic

vim.api.nvim_set_hl(0, "@include", { fg = palette.red })
vim.api.nvim_set_hl(0, "@constant", { fg = palette.orange })
vim.api.nvim_set_hl(0, "@function", { fg = palette.green, style = nil })
vim.api.nvim_set_hl(0, "@function.call", { fg = palette.green })
vim.api.nvim_set_hl(0, "@method.call", { fg = palette.green })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#707070" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = nil })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = nil })
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#323742" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#323742" })
vim.api.nvim_set_hl(0, "CursorLine", { fg = nil, bg = nil })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#707070" })
vim.api.nvim_set_hl(0, "@neorg.tags.ranged_verbatim.code_block", { bg = "#101010" })

-- Disable highlight overrides made by the LSP.
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
