local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
    ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "glsl",
        "javascript",
        "php",
        "python",
        "sql",
    },
    sync_install = false,
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
})
