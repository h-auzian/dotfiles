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

-- Start/End of line with U/O
set("", "o", "(v:count == 0 ? 'g$' : '$')", { expr = true })
set("", "u", "(v:count == 0 ? 'g0' : '0')", { expr = true })

-- Move lines up and down
set("v", "I", ":m '>-2<CR>gv=gv")
set("v", "K", ":m '>+1<CR>gv=gv")

-- Jump to next/previous function
set("n", "<C-h>", "[m", { remap = true })
set("n", "<C-n>", "]m", { remap = true })

-- Enter insert mode above/below current line
set("n", "U", "O", opts)
set("n", "O", "o", opts)

-- Paste in visual mode without yanking
set("v", "p", '"_dp')
set("v", "P", '"_dP')

-- Movement inside file
set("n", "<C-u>", "<C-u>zz", opts)    -- Go up half a screen
set("n", "<C-o>", "<C-d>zz", opts)    -- Go up half a screen
set("n", "<leader>j", "<C-o>", opts)  -- Go to previous position with leader key
set("n", "<C-j>", "<C-o>", opts)      -- Go to previous position with CTRL key
set("n", "<leader>l", "<C-i>", opts)  -- Go to next position with leader key
set("n", "<C-l>", "<C-i>", opts)      -- Go to next position with CTRL key

-- Change indentation in visual mode
set("v", "<Tab>", "> gv", opts)
set("v", "<S-Tab>", "< gv", opts)

-- Undo/Redo
set("n", "<C-z>", "u", opts)
set("n", "<C-y>", "<C-r>", opts)
set("i", "<C-z>", "<C-O>u", opts)
set("i", "<C-y>", "<C-O><C-r>", opts)

-- Buffers
set("n", "<leader>u", ":bprevious<CR>")   -- Go to previous buffer with leader key
-- set("n", "<C-u>", ":bprevious<CR>")       -- Go to previous buffer with CTRL key
set("n", "<leader>o", ":bnext<CR>")       -- Go to next buffer with leader key
-- set("n", "<C-o>", ":bnext<CR>")           -- Go to next buffer with CTRL key
-- set("n", "<leader>s", ":w<CR>")           -- Save buffer with leader key
set("n", "<C-s>", ":w<CR>", opts)         -- Save buffer with CTRL+S

-- NvimTree
-- set("", "<leader>|", ":NvimTreeFindFileToggle<CR>")       -- Show side bar with focus on current file
-- set("", "<leader>aj", ":NvimTreeResize +10<CR>")          -- Increase width
-- set("", "<leader>al", ":NvimTreeResize -10<CR>")          -- Decrease width

-- Misc
set("i", "<C-v>", "<C-R>*", opts)                 -- Paste with CTRL+V in insert mode
set("i", "<C-BS>", "<C-w>", opts)                 -- Delete word with CTRL+Backspace in insert mode
set("n", "<leader>i", "zz")                       -- Center cursor vertically
-- set("n", "<leader>v", "gcc", { noremap = false })
