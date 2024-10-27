vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>cd", ":cd %:h<cr>", {desc = "Set current directory to the file in the active buffer."})

keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move down selection in visual mode."})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move up selection in visual mode."})

-- Keeps the cursor for J position
-- This doesn't allow to call e.g. 5J
-- keymap.set("n", "J", "mzJ`z", {desc = "Join lines with cursor remaining in the current position"})

keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Scroll down half page, keep cursor in center."})
keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Scroll up half page, keep cursor in center."})

keymap.set("n", "n", "nzzzv", {desc = "Next match in search, keep cursor in center."})
keymap.set("n", "N", "Nzzzv", {desc = "Previous match in search, keep cursor in center."})

keymap.set("x", "<leader>p", "\"_dP", {desc = "Put over selection without updating register."})

keymap.set("n", "<leader>y", "\"+y", {desc = "Yank selection to system clipboard"})
keymap.set("v", "<leader>y", "\"+y", {desc = "Yank selection to system clipboard"})
keymap.set("n", "<leader>Y", "\"+Y", {desc = "Yank line to system clipboard"})
keymap.set("n", "<leader>d", "\"_d", {desc = "Delete to black hole register."})
keymap.set("v", "<leader>d", "\"_d", {desc = "Delete to black hole register."})

keymap.set("n", "<C-k>", vim.cmd.bnext, {desc = "Move to next buffer."})
keymap.set("n", "<C-j>", vim.cmd.bprevious, {desc = "Move to previous buffer."})
keymap.set("n", "<leader>q", ":bp <BAR> bd #<CR>", {desc = "Delete current buffer and switch to previous one."})
keymap.set("n", "<leader>ts", ":lua vim.treesitter.stop()<CR>", {desc = "Stop treesitter."})

keymap.set("n", "<leader>cc", ":cclose<CR>", {desc = "Close quickfix window."})
keymap.set("n", "<leader>cn", ":cnext<CR>", {desc = "Next item in quickfix window."})
keymap.set("n", "<leader>cp", ":cprevious<CR>", {desc = "Previous item in quickfix window."})

keymap.set("n", "<leader>x", ":!chmod +x %<CR>", {desc = "Make current file executable (chmod +x)."})

-- TODO
-- keymap.set("n", "<leader>c", ":e ~/setup/cheat_sheet.txt<CR>")
keymap.set("n", "<leader>v", ":e ~/.config/nvim/lua/eugen<CR>", {desc = "Open nvim config folder."})
--keymap.set("n", "<leader>b", ":e ~/setup/bashrc<CR>")
