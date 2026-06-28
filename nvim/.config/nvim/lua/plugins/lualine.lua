local function transparent_statusline_hl()
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
end

return {
  "nvim-lualine/lualine.nvim",
  init = function()
    -- opts runs before colorscheme/lualine setup; re-apply after they set highlights
    vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent_statusline_hl })
  end,
  opts = function(_, opts)
    local t = { bg = "none" }
    local sections = { a = t, b = t, c = t, x = t, y = t, z = t }
    opts.options.theme = {
      normal = sections,
      insert = sections,
      visual = sections,
      replace = sections,
      command = sections,
      inactive = sections,
    }
    opts.options.component_separators = ""
    opts.options.section_separators = ""
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
    transparent_statusline_hl()
  end,
}
