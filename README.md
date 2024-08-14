# dotfiles

My desktop configuration for various tools

## Table Of Contents

<!--toc:start-->

- [dotfiles](#dotfiles)
  - [Table Of Contents](#table-of-contents)
  - [Available Configuration](#available-configuration)
  - [How to install](#how-to-install)
  <!--toc:end-->

## Available Configuration

- vim
- tmux
- zsh
- nvim
- gdb
- brew
- vscode
- mise
- fish
- wezterm
- kitty
- starship

## How to install

I use `stow` for the managers. You can install the stow first then clone this repository to Home `(~)` directory. Then just `stow <package>` anything you want to.

For example if i want to install nvim configuration to this laptop, so the steps are

- clone the repository to ~/dotfiles.
- run the command `stow nvim` and it will automatically create the symlink to the `~/.config/nvim`.
- and just like that, the configuration for nvim is already applied.
