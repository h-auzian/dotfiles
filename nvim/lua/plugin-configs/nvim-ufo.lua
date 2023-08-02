local status_ok, nvim_ufo = pcall(require, "ufo")
if not status_ok then
	return
end

local o = vim.opt
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.foldnestmax = 1

nvim_ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {"indent"}
    end
})
