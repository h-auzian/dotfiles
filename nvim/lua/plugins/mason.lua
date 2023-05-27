local status_ok, mason = pcall(require, "mason")

if not status_ok then
	return
end

mason.setup({
    ui = {
        keymaps = {
            install_package = "I",
            update_package = "U",
            uninstall_package = "X",
        }
    }
})
