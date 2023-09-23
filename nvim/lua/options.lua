local o = vim.opt

-- General
o.number = true
o.relativenumber = true
o.title = false
o.mouse = "a"

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.shiftround = true
o.expandtab = true
o.smartindent = true


o.hidden = true
o.scrolloff = 15

o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

o.spelllang = "en,es"
o.swapfile = false

o.cmdheight = 0;

o.backspace = [[indent,eol,start]]

o.list = false
o.listchars:append "tab:> "
o.listchars:append "space:⋅"

o.splitright = true
o.splitbelow = true

-- Wrap long lines into multiple ones, but without splitting any word.
-- Initially disabled; toggleable with a keybind.
o.wrap = false
o.breakindent = true
o.breakindentopt = "shift:2"
o.lbr = true

-- Colors and themes
o.termguicolors = true
o.background = "dark"
vim.cmd("colorscheme gruvbox-material")

-- Options per filetype
vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType dart setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType cpp setlocal noexpandtab")
vim.cmd("autocmd FileType hpp setlocal noexpandtab")
vim.cmd("autocmd FileType html setlocal noexpandtab")
vim.cmd("autocmd FileType htmldjango setlocal noexpandtab")
