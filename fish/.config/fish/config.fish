source ~/.config/fish/conf.d/abbr.fish
source ~/.config/fish/conf.d/alias.fish
source ~/.config/fish/conf.d/variables.fish
source ~/.config/fish/conf.d/path.fish
source ~/.config/fish/conf.d/functions.fish
source ~/.config/fish/conf.d/nix.fish
source ~/.config/fish/conf.d/fzf.fish

## Plugins
starship init fish | source
zoxide init fish | source
direnv hook fish | source
if command -q workmux
    workmux completions fish | source
end
jj util completion fish | source

fzf --fish | source

# Clear inherited __MISE_ORIG_PATH so mise captures a fresh one each shell start
# (prevents tmux from inheriting a stale path that excludes mise shims)
set -e __MISE_ORIG_PATH
mise activate fish | source
eval (tmuxifier init - fish)

# OrbStack integration on macOS.
if test (uname) = Darwin; and test -f ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish
end

# pnpm
if test (uname) = Darwin
    set -gx PNPM_HOME "$HOME/Library/pnpm"
else
    set -l data_home "$HOME/.local/share"
    if set -q XDG_DATA_HOME; and test -n "$XDG_DATA_HOME"
        set data_home "$XDG_DATA_HOME"
    end
    set -gx PNPM_HOME "$data_home/pnpm"
end
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
