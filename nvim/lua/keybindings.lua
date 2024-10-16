vim.g.mapleader = " "
vim.g.maplocalleader = "'"

local set = vim.keymap.set
local opts = { noremap = true }

-- Exit insert mode
set("i", "jk", "<ESC>", opts)
set("i", "JK", "<ESC>", opts)

-- Movement with IJKL
set({"n", "x", "o"}, "i", "(v:count == 0 ? 'gkzz' : 'kzz')", { expr = true })
set({"n", "x", "o"}, "k", "(v:count == 0 ? 'gjzz' : 'jzz')", { expr = true })
set({"n", "x", "o"}, "j", "h", opts)

-- Enter insert mode
set({"n", "x"}, "h", "i", opts)
set({"n", "x"}, "H", "I", opts)

-- Go to start/end of line taking word wrap into account
set({"n", "x", "o"}, "u", "(v:count == 0 ? 'g0' : '0')", { expr = true })
set({"n", "x", "o"}, "o", "(v:count == 0 ? 'g$' : '$')", { expr = true })

-- Move lines up and down
set("x", "K", ":m '>+1<CR>gv=gv")
set("x", "I", ":m '>-2<CR>gv=gv")

-- Jump to next/previous function
set("n", "<C-p>", "[m", opts)
set("n", "<C-n>", "]m", opts)

-- Insert line above/below current line
set("n", "U", "O<esc>", opts)
set("n", "O", "o<esc>", opts)

-- Paste in visual mode without yanking
set("x", "p", '"_dp')
set("x", "P", '"_dP')

-- Paste text and autoindent
set("n", "P", "p==")

-- Move half a screen up/down while keeping the view centered
set({"n", "x"}, "<C-u>", "<C-u>zz", opts)
set({"n", "x"}, "<C-o>", "<C-d>zz", opts)

-- Jump forwards/backwards using ctrl
set("n", "<C-j>", "<C-o>", opts)
set("n", "<C-l>", "<C-i>", opts)

-- Change indentation in visual mode
set("x", "<Tab>", "> gv", opts)
set("x", "<S-Tab>", "< gv", opts)

-- Undo/Redo
set("n", "<C-z>", "u", opts)
set("n", "<C-y>", "<C-r>", opts)
set("i", "<C-z>", "<C-O>u", opts)
set("i", "<C-y>", "<C-O><C-r>", opts)
set("x", "<C-z>", "", opts)

-- Set/go to marker
set("n", "ñ<space>", "m", opts)
set("n", "ñ", "'", opts)

-- Record/play macro
set("n", "Q", "q", opts)
set("n", "q", "@", opts)

-- Alternate between brackets
set({"n", "x"}, "<leader>o", "%")

-- Paste using ctrl+v in insert mode
set("i", "<C-v>", "<C-R>*", opts)

-- Delete word using ctrl+backspace in insert mode
set("i", "<C-h>", "<C-w>", opts)

-- Keep the cursor position after pasting in visual mode
set("x", "y", "ygv<ESC>")

-- Yank without exiting visual mode
set("x", "Y", "ygv")
set("x", "<C-c>", "ygv")

-- Misc
set("n", "yaw", "yiw", opts)
