-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Vertical motions
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Delete a word backwards
keymap.set("n", "dW", "vbd")

-- Buffer switching
keymap.set("n", "<tab>", ":bnext<Return>", opts)
keymap.set("n", "<s-tab>", ":bprev<Return>", opts)

-- Debugging
keymap.set("n", "<F8>", [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
keymap.set("n", "<F9>", [[:lua require"dap".continue()<CR>]], { noremap = true })
keymap.set("n", "<F10>", [[:lua require"dap".step_over()<CR>]], { noremap = true })
keymap.set("n", "<S-F10>", [[:lua require"dap".step_into()<CR>]], { noremap = true })
keymap.set("n", "<F12>", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
keymap.set("n", "<F5>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
