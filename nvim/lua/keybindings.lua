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
-- set("n", "<C-h>", "[m", { remap = true })
-- set("n", "<C-n>", "]m", { remap = true })

-- Insert line above/below current line
set("n", "U", "O<esc>", opts)
set("n", "O", "o<esc>", opts)

-- Paste in visual mode without yanking
set("v", "p", '"_dp')
set("v", "P", '"_dP')

-- Movement inside file
set("n", "<C-u>", "<C-u>zz", opts)    -- Go up half a screen
set("n", "<C-o>", "<C-d>zz", opts)    -- Go up half a screen
set("n", "<C-j>", "<C-o>", opts)      -- Go to previous position with CTRL key
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
-- set("n", "<leader>u", ":bprevious<CR>")   -- Go to previous buffer with leader key
-- set("n", "<C-u>", ":bprevious<CR>")       -- Go to previous buffer with CTRL key
-- set("n", "<leader>o", ":bnext<CR>")       -- Go to next buffer with leader key
-- set("n", "<C-o>", ":bnext<CR>")           -- Go to next buffer with CTRL key
set("n", "<leader>j", "<C-6>", opts)         -- Jump to last buffer in normal mode with leader key
set("n", "<A-S-l>", "<C-6>", opts)           -- Jump to last buffer in normal mode
set("i", "<A-S-l>", "<C-O><C-6>", opts)      -- Jump to last buffer in insert mode

-- NvimTree
-- set("", "<leader>|", ":NvimTreeFindFileToggle<CR>")       -- Show side bar with focus on current file
-- set("", "<leader>aj", ":NvimTreeResize +10<CR>")          -- Increase width
-- set("", "<leader>al", ":NvimTreeResize -10<CR>")          -- Decrease width

-- Misc
set("", "<leader>o", "%")                         -- Go to starting/closing bracket
set("i", "<C-v>", "<C-R>*", opts)                 -- Paste with CTRL+V in insert mode
set("i", "<C-h>", "<C-w>", opts)                  -- Delete word with CTRL+h in insert mode
set("n", "<leader>k", "zz")                       -- Center cursor vertically
-- set("n", "<leader>u", "g~")                       -- Toggle uppercase/lowercase in normal mode
-- set("v", "<leader>u", "~")                        -- Toggle uppercase/lowercase in visual mode
set("n", "<cr>", "ciw")                           -- Delete current word and enter insert mode
set("v", "y", "ygv<esc>")                         -- Stay in position after yanking in visual mode
