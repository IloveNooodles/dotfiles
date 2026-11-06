set -e fish_user_paths

# mise shims must come before system paths so mise-managed tools (e.g. ruby)
# take priority over macOS system versions in /usr/bin
set -gx PATH $HOME/.local/share/mise/shims $PATH

# Homebrew is only used on macOS.
if test (uname) = Darwin; and test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH /nix/var/nix/profiles/default/bin $PATH
if test -d /run/current-system/sw/bin
    fish_add_path /run/current-system/sw/bin
end
fish_add_path $HOME/.nix-profile/bin

set -x ZSH "$HOME/.oh-my-zsh"
fish_add_path $HOME/.tmuxifier/bin
# set -x PATH "/opt/homebrew/opt/ruby/bin:$PATH"

# Go
# set -x GOPATH "$HOME/go"
# set -x GOROOT "$(brew --prefix golang)/libexec"
# set -x PATH "$PATH:$GOPATH/bin"
# set -x PATH "$PATH:$GOROOT/bin"

# tmuxifier
set -x TMUXIFIER_NO_COMPLETE 1
set -x EDITOR nvim

# FZF
set -Ux FZF_DEFAULT_COMMAND "fd --type f"
set -Ux FZF_CTRL_T_COMMAND "fd --type f"
set -Ux FZF_ALT_C_COMMAND "fd --type d"
