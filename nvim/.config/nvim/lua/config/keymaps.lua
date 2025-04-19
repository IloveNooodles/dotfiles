-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

if vim.g.vscode then
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local vscode = require("vscode")

  -- Show whichkey using VSCode actions
  keymap("n", "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)
  keymap("x", "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)

  -- -- yank to system clipboard
  keymap({ "n", "v" }, "<leader>y", '"+y', opts)

  -- -- paste from system clipboard
  keymap({ "n", "v" }, "<leader>p", '"+p', opts)

  -- better indent handling
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- move text up and down
  keymap("v", "J", ":m .+1<CR>==", opts)
  keymap("v", "K", ":m .-2<CR>==", opts)
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

  -- paste preserves primal yanked piece
  keymap("v", "p", '"_dP', opts)

  -- removes highlighting after escaping vim search
  keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

  -- call vscode commands from neovim
  keymap({ "n", "v" }, "<leader>t", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, opts)
  keymap({ "n", "v" }, "<leader>b", function()
    vscode.action("editor.debug.action.toggleBreakpoint")
  end, opts)
  keymap({ "n", "v" }, "<leader>d", function()
    vscode.action("editor.action.showHover")
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
  keymap({ "n", "v" }, "<leader>cp", function()
    vscode.action("workbench.action.showCommands")
  end, opts)
  keymap({ "n", "v" }, "<leader>pr", function()
    vscode.action("code-runner.run")
  end, opts)
  keymap({ "n", "v" }, "<leader>fd", function()
    vscode.action("editor.action.formatDocument")
  end, opts)
end
