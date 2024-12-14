return {
  "preservim/vimux",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>tp", ":VimuxPromptCommand<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tc", ":VimuxRunLastCommand<CR>", { noremap = true, silent = true })
  end,
}
