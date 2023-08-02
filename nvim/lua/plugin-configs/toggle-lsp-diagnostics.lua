local status_ok, toggle_lsp_diagnostics = pcall(require, "toggle_lsp_diagnostics")
if not status_ok then
	return
end

toggle_lsp_diagnostics.init(vim.diagnostic.config())
