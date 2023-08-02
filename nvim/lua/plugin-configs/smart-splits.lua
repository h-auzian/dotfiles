local status_ok, smart_splits = pcall(require, "smart-splits")
if not status_ok then
	return
end

smart_splits.setup({
    resize_mode = {
        resize_keys = { "j", "k", "i", "l" },
    },
})
