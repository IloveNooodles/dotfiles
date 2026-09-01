# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

# source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ==== Export
export ZSH="$HOME/.oh-my-zsh"
export PATH="/Users/gawrgare/Library/Python/3.9/bin:$PATH"
export PATH="$PATH:/usr/bin"
export PATH="$HOME/.tmuxifier/bin:$PATH"
# Homebrew Ruby removed - use mise to manage Ruby versions instead
# export GOPATH=$HOME/go
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# tmuxifier
export TMUXIFIER_NO_COMPLETE=1
export EDITOR=nvim

# Eval
eval "$(tmuxifier init -)"

# ==== Alias
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
# alias cat="bat --paging=never"
alias ls="ls -lah"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias l="ls -lF -G"
alias la="ls -laF -G"
alias lsd="ls -lF -G | grep --color=never '^d'"
alias ls="command ls -G"
alias python="/usr/bin/python3"
alias pn="pnpm"
alias k="kubectl"
alias gs="git status"
alias lg='lazygit'
alias tmuxy="tmuxifier"
# ==== Function
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/gawrgare/.bun/_bun" ] && source "/Users/gawrgare/.bun/_bun"

eval "$(/opt/homebrew/bin/mise activate zsh)"
. "/Users/gawrgare/.deno/env"
