return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, c)
      hl.CursorLine = { bg = "none", underline = true }
      hl.StatusLine = { bg = "none", fg = c.fg_dark }
      hl.StatusLineNC = { bg = "none", fg = c.fg_dark }
    end,
  },
  enabled = true,
}
