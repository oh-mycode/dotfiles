-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cL", ":set invlist<CR>", { desc = "Show list symbol" })
-- vim.keymap.set("n", "<leader>cc", ":set  s<CR>", { desc = "Show list symbol" })
-- greatest remap ever
vim.keymap.set("n", "x", '"_x', { desc = "Remove symbol without copying" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without copying" })
