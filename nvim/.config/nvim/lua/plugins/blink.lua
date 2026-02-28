return {
  "saghen/blink.cmp",
  enable = true,
  opts = {
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        border = "single",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
        "copilot",
        "dadbod",
      },
      providers = {
        lsp = {
          min_keyword_length = 2,
          score_offset = 100,
        },
        snippets = {
          min_keyword_length = 2,
          score_offset = 50,
        },
        path = {
          min_keyword_length = 5,
          score_offset = 25,
        },
        buffer = {
          min_keyword_length = 5,
          score_offset = 2,
        },
        copilot = {
          min_keyword_length = 0,
          score_offset = 1,
        },
      },
    },
  },
}
