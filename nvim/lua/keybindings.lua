vim.g.mapleader = " "

local set = vim.keymap.set
local opts = { noremap = true }

-- Exit insert mode
set("i", "jk", "<ESC>", opts)
set("i", "JK", "<ESC>", opts)

-- Movement with IJKL
set("", "i", "(v:count == 0 ? 'gk' : 'k')", { expr = true })
set("", "k", "(v:count == 0 ? 'gj' : 'j')", { expr = true })
set("", "j", "h", opts)
set("", "h", "i", opts)
set("", "H", "I", opts)

-- Start/End of line with o/j
set("", "o", "(v:count == 0 ? 'g$' : '$')", { expr = true })
set("", "u", "(v:count == 0 ? 'g0' : '0')", { expr = true })

-- Move lines up and down
set("v", "I", ":m '>-2<CR>gv=gv")
set("v", "K", ":m '>+1<CR>gv=gv")

-- Jump to next/previous function
set("n", "<C-p>", "[m", opts)
set("n", "<C-n>", "]m", opts)

-- Insert line above/below current line
set("n", "U", "O<esc>", opts)
set("n", "O", "o<esc>", opts)

-- Paste in visual mode without yanking
set("v", "p", '"_dp')
set("v", "P", '"_dP')

-- Move half a screen up/down while keeping the view centered
set("n", "<C-u>", "<C-u>zz", opts)
set("n", "<C-o>", "<C-d>zz", opts)

-- Jump forwards/backwards using ctrl
set("n", "<C-j>", "<C-o>", opts)
set("n", "<C-l>", "<C-i>", opts)

-- Change indentation in visual mode
set("v", "<Tab>", "> gv", opts)
set("v", "<S-Tab>", "< gv", opts)

-- Undo/Redo
set("n", "<C-z>", "u", opts)
set("n", "<C-y>", "<C-r>", opts)
set("i", "<C-z>", "<C-O>u", opts)
set("i", "<C-y>", "<C-O><C-r>", opts)

-- Jump to previous buffer using alt instead of leader
set("n", "<A-S-l>", "<C-6>", opts)
set("i", "<A-S-l>", "<C-O><C-6>", opts)

-- Alternate between brackets
set("", "<leader>o", "%")

-- Paste using ctrl+v in insert mode
set("i", "<C-v>", "<C-R>*", opts)

-- Delete word using ctrl+backspace in insert mode
set("i", "<C-h>", "<C-w>", opts)

-- Keep the cursor position after pasting in visual mode
set("v", "y", "ygv<esc>")
