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
