-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- remap the delete and change behaviour
vim.keymap.set({ "n", "v" }, "d", '"_d', opts)
vim.keymap.set({ "n", "v" }, "D", '"_D', opts)
vim.keymap.set({ "n", "v" }, "c", '"_c', opts)
vim.keymap.set({ "n", "v" }, "C", '"_C', opts)
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

if vim.g.vscode then
  local keymap = vim.keymap.set
  local vscode = require("vscode")

  -- Show whichkey using VSCode actions
  keymap({ "n", "x" }, "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)

  -- <space>gg to open lazygit in terminal
  keymap("n", "<leader>gg", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
    vscode.action("workbench.action.terminal.sendSequence", { args = { text = "lazygit\n" } })
  end, opts)

  -- paste preserves primal yanked piece
  keymap("v", "p", '"_dP', opts)

  -- removes highlighting after escaping vim search
  keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

  -- Sidebar and Terminal visibility
  keymap(
    { "n", "v" },
    "<leader>t",
    "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>",
    opts
  )
  keymap(
    { "n", "v" },
    "<leader>e",
    "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>",
    opts
  )

  -- folding
  keymap("n", "za", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>", opts)
  keymap("n", "zM", "<cmd>lua require('vscode').action('editor.foldAll')<CR>", opts)
  keymap("n", "zR", "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>", opts)

  -- quick action keymaps
  keymap({ "n", "v" }, "<leader>qf", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opts)
  keymap({ "n", "v" }, "<leader>fp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", opts)
  keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opts)
  keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", opts)

  -- harpoon keymaps
  keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>", opts)
  keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>", opts)
  keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>", opts)

  -- project manager keymaps
  keymap({ "n", "v" }, "<leader>ap", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>", opts)
  keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>", opts)
  keymap(
    { "n", "v" },
    "<leader>lp",
    "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>",
    opts
  )
end
