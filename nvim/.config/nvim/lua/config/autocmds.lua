-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd("TwilightEnable")
  end,
})

local notify_backup = vim.notify

-- Disable notifications
local function disable_notifications()
  vim.notify = function() end
end

-- Enable notifications
local function enable_notifications()
  vim.notify = notify_backup
end

-- Autocmd for Rust files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    disable_notifications()
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.rs",
  callback = function()
    enable_notifications()
  end,
})
