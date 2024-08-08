local o = vim.opt

-- General
o.number = true
o.relativenumber = true
o.title = false
o.mouse = "a"
o.fillchars:append{ eob = " " }

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.shiftround = true
o.expandtab = true
o.smartindent = true
o.foldlevelstart = 99

o.hidden = true
o.scrolloff = 15

o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

o.spelllang = "en,es"
o.swapfile = false
o.backupcopy = "yes"

o.cmdheight = 0;

o.backspace = [[indent,eol,start]]

o.list = false
o.listchars:append "tab:> "
o.listchars:append "space:⋅"

-- Splits.
o.splitright = true
o.splitbelow = true
o.winminwidth = 20

-- Wrap long lines into multiple ones, but without splitting any word.
-- Initially disabled; toggleable with a keybind.
o.wrap = false
o.breakindent = true
o.breakindentopt = "shift:2"
o.lbr = true
o.formatoptions = "q"

-- Colors
o.termguicolors = true
o.background = "dark"

-- Options per filetype
vim.cmd("autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType dart setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType cpp,hpp setlocal noexpandtab")
vim.cmd("autocmd FileType html,htmldjango,css setlocal noexpandtab")
vim.cmd("autocmd FileType text,markdown,tex,norg setlocal wrap")
vim.cmd("autocmd FileType php setlocal autoindent")
vim.cmd("autocmd FileType norg setlocal conceallevel=2")
