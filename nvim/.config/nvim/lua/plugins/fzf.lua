local actions = require("fzf-lua.actions")

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    "default-title",
    no_header = true,
    fzf_colors = true,
    fzf_opts = {
      ["--no-scrollbar"] = true,
    },
    defaults = {
      formatter = "path.filename_first",
      -- formatter = "path.dirname_first",
    },
    files = {
      cwd_prompt = false,
      actions = {
        ["alt-i"] = { actions.toggle_ignore },
        ["alt-u"] = { actions.toggle_hidden },
      },
    },
    grep = {
      actions = {
        ["alt-i"] = { actions.toggle_ignore },
        ["alt-u"] = { actions.toggle_hidden },
      },
    },
  },
}
