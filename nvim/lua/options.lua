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

o.wrap = false
o.hidden = true
o.scrolloff = 15

o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

o.spelllang = "en,es"
o.swapfile = false

o.backspace = [[indent,eol,start]]

-- Colors and themes
o.termguicolors = true
vim.cmd("colorscheme gruvbox")

-- Options per filetype
vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2")
vim.cmd("autocmd FileType dart setlocal shiftwidth=2 softtabstop=2")
