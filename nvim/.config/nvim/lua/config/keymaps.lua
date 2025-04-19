-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- remap the delete and change behaviour
vim.keymap.set("n", "d", '"_d', opts)
vim.keymap.set("n", "D", '"_D', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "D", '"_D', opts)
vim.keymap.set("n", "c", '"_c', opts)
vim.keymap.set("v", "D", '"_D', opts)
vim.keymap.set("n", "c", '"_c', opts)
vim.keymap.set("v", "c", '"_c', opts)
vim.keymap.set("n", "C", '"_C', opts)
vim.keymap.set("v", "C", '"_C', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

-- Search navigation
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "*", "*zzzv", opts)
vim.keymap.set("n", "#", "#zzzv", opts)
vim.keymap.set("n", "g*", "g*zzzv", opts)
vim.keymap.set("n", "g#", "g#zzzv", opts)

-- File navigation
vim.keymap.set("n", "G", "Gzz", opts)
vim.keymap.set("n", "gg", "ggzz", opts)
vim.keymap.set("n", "%", "%zz", opts)
vim.keymap.set("n", "{", "{zz", opts)
vim.keymap.set("n", "}", "}zz", opts)

-- Paragraph/section navigation
vim.keymap.set("n", "(", "(zz", opts)
vim.keymap.set("n", ")", ")zz", opts)
vim.keymap.set("n", "[[", "[[zz", opts)
vim.keymap.set("n", "]]", "]]zz", opts)
vim.keymap.set("n", "[{", "[{zz", opts)
vim.keymap.set("n", "]}", "]}zz", opts)

-- LSP navigation
vim.keymap.set("n", "gd", "gdzz", opts)
vim.keymap.set("n", "gD", "gDzz", opts)
vim.keymap.set("n", "gi", "gizz", opts)
vim.keymap.set("n", "gr", "grzz", opts)

if vim.g.vscode then
  local keymap = vim.keymap.set
  local vscode = require("vscode")

  -- Show whichkey using VSCode actions
  keymap("n", "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)
  keymap("x", "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)

  -- <space>gg to open lazygit in terminal
  keymap("n", "<leader>gg", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
    vscode.action("workbench.action.terminal.sendSequence", { args = { text = "lazygit\n" } })
  end, opts)

  -- paste preserves primal yanked piece
  keymap("v", "p", '"_dP', opts)

  -- call vscode commands from neovim
  keymap({ "n", "v" }, "<leader>t", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, opts)
  keymap({ "n", "v" }, "<leader>a", function()
    vscode.action("editor.action.quickFix")
  end, opts)
  keymap({ "n", "v" }, "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end, opts)
  keymap({ "n", "v" }, "<leader>sp", function()
    vscode.action("workbench.actions.view.problems")
  end, opts)
  keymap({ "n", "v" }, "<leader>cn", function()
    vscode.action("notifications.clearAll")
  end, opts)
  keymap({ "n", "v" }, "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, opts)
  keymap({ "n", "v" }, "<leader>fd", function()
    vscode.action("editor.action.formatDocument")
  end, opts)
end
