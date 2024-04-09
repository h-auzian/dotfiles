return {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    init = function ()
        local toggle_lsp_diagnostics = require("toggle_lsp_diagnostics")
        toggle_lsp_diagnostics.init(vim.diagnostic.config())
    end,
}
