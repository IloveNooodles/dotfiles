source ~/.config/fish/conf.d/abbr.fish
source ~/.config/fish/conf.d/alias.fish
source ~/.config/fish/conf.d/path.fish
source ~/.config/fish/conf.d/variables.fish

## Plugins
starship init fish | source
zoxide init fish | source
fzf --fish | source
mise activate fish | source
eval (tmuxifier init - fish)
