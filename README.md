# dotfiles

My desktop configuration for various tools

## Table Of Contents

<!--toc:start-->

- [dotfiles](#dotfiles)
  - [Available Configuration](#available-configuration)
  - [How to install](#how-to-install)
  <!--toc:end-->

## Available Configuration

- vim
- tmux
- zsh
- nvim
- gdb

## How to install

I use `stow` for the managers. You can install the stow first then clone this repository to Home `(~)` directory. Then just `stow <package>` anything you want to. For example if i want to install nvim to the laptop i can do `stow nvim` and it will automatically create the symlink to the `~/.config/nvim`
