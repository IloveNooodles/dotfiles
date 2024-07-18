-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sx", require("telescope.builtin").resume, {
  noremap = true,
  silent = true,
  desc = "Resume",
})

vim.keymap.set("n", "<leader>fB", ":Telescope file_browser path=%:p:h=%:p:h<CR>", {
  desc = "Browse Files",
})

vim.keymap.set("v", "<leader>p", '"_dP', {})

-- remap the delete and change behaviour
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("v", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("v", "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("n", "C", '"_C', { noremap = true, silent = true })
vim.keymap.set("v", "C", '"_C', { noremap = true, silent = true })
