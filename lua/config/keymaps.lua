-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Vertical motions
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Debugging
keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Debug: Continue" })
keymap.set("n", "<F8>", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
keymap.set("n", "<S-F10>", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
keymap.set("n", "<F12>", function() require("dap.ui.widgets").hover() end, { desc = "Debug: Hover" })
