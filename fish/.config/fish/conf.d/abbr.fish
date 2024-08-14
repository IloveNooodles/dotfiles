if status is-interactive
    abbr --add tkill 'tmux kill-session -t'
    abbr --add usebash 'chsh -s $(which bash)'
    abbr --add usezsh 'chsh -s $(which zsh)'
    abbr --add usefish 'chsh -s $(which fish)'
end
