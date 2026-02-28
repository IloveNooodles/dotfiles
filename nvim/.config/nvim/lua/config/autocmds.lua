-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Resizes
vim.api.nvim_create_user_command("Vr", function(opts)
  local usage = "Usage: [VirticalResize] :Vr {number (%)}"
  if not opts.args or not string.len(opts.args) == 2 then
    print(usage)
    return
  end
  vim.cmd(":vertical resize " .. vim.opt.columns:get() * (opts.args / 100.0))
end, { nargs = "*" })

vim.api.nvim_create_user_command("Hr", function(opts)
  local usage = "Usage: [HorizontalResize] :Hr {number (%)}"
  if not opts.args or not string.len(opts.args) == 2 then
    print(usage)
    return
  end
  vim.cmd(":resize " .. ((vim.opt.lines:get() - vim.opt.cmdheight:get()) * (opts.args / 100.0)))
end, { nargs = "*" })

-- Handling jar go to definition
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "jar://*",
  callback = function(args)
    local path = args.match
    local jar_path, internal_path = path:match("jar://(.+)!/(.+)")

    if jar_path and internal_path then
      local content = vim.fn.systemlist(string.format("unzip -p '%s' '%s'", jar_path, internal_path))

      if #content > 0 then
        vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, content)

        vim.bo[args.buf].modifiable = false
        vim.bo[args.buf].buftype = "nowrite"

        local ext = internal_path:match("^.+%.(.+)$")
        local ft = (ext == "kt") and "kotlin" or "java"
        vim.bo[args.buf].filetype = ft

        vim.schedule(function()
          local active_clients = vim.lsp.get_clients({ bufnr = 0 })
          if #active_clients == 0 then
            local project_clients = vim.lsp.get_clients({ name = (ft == "java" and "jdtls" or "kotlin_lsp") })
            for _, client in ipairs(project_clients) do
              vim.lsp.buf_attach_client(args.buf, client.id)
            end
          end
        end)
      end
    end
  end,
})
