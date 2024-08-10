-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

map("n", "<leader>[", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>]", "<cmd>bnext<cr>", { desc = "Next Buffer" })
