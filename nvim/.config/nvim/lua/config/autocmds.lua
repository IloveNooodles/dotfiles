-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Resizes
local function resize_percentage(args, command)
  local percent = tonumber(args)
  if not percent or percent <= 0 or percent > 100 then
    vim.notify("Usage: :" .. command .. " {percentage (1-100)}", vim.log.levels.ERROR)
    return
  end
  return percent
end

vim.api.nvim_create_user_command("Vr", function(opts)
  local percent = resize_percentage(opts.args, "Vr")
  if not percent then
    return
  end
  vim.cmd("vertical resize " .. math.max(1, math.floor(vim.o.columns * percent / 100)))
end, { nargs = "*" })

vim.api.nvim_create_user_command("Hr", function(opts)
  local percent = resize_percentage(opts.args, "Hr")
  if not percent then
    return
  end
  vim.cmd("resize " .. math.max(1, math.floor((vim.o.lines - vim.o.cmdheight) * percent / 100)))
end, { nargs = "*" })

-- Handling jar go to definition
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "jar://*",
  callback = function(args)
    local path = args.match
    local jar_path, internal_path = path:match("jar://(.+)!/(.+)")

    if jar_path and internal_path then
      local content = vim.fn.systemlist({ "unzip", "-p", jar_path, internal_path })
      if vim.v.shell_error ~= 0 then
        vim.notify("Could not read " .. path .. " from JAR", vim.log.levels.ERROR)
        return
      end

      if #content > 0 then
        vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, content)

        vim.bo[args.buf].modifiable = false
        vim.bo[args.buf].buftype = "nowrite"

        local ext = internal_path:match("^.+%.(.+)$")
        local ft = (ext == "kt") and "kotlin" or "java"
        vim.bo[args.buf].filetype = ft

        vim.schedule(function()
          local active_clients = vim.lsp.get_clients({ bufnr = args.buf })
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
