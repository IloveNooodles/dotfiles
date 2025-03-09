source ~/.config/fish/conf.d/abbr.fish
source ~/.config/fish/conf.d/alias.fish
source ~/.config/fish/conf.d/variables.fish
source ~/.config/fish/conf.d/path.fish
source ~/.config/fish/conf.d/functions.fish

## Plugins
starship init fish | source
zoxide init fish | source
direnv hook fish | source
fzf --fish | source
mise activate fish | source
eval (tmuxifier init - fish)

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
