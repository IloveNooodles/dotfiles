return {
  "saghen/blink.cmp",
  enable = true,
  opts = {
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
