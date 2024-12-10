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
- aerospace

## Tools

### tmux

tmux is terminal multiplexer, i used tmux mainly for the work

### wezterm

wezterm is the terminal application, i used this because it has the kitty image protocol and also a lot of good stuff and can integrate well with tmux

### fish

fish is friendly shell, the syntax is a bit different from the zsh or bash but it has some nice feature in it

### mise

mise is tool version manager for all of the programming language from ruby, node and all

### aerospace

aerospace is tiling manager for mac-OS, the configuration is similar to i3

## How to install

I use `stow` for the managers. You can install the stow first then clone this repository to Home `(~)` directory. Then just `stow <package>` anything you want to.

For example if i want to install nvim configuration to this laptop, so the steps are

- clone the repository to ~/dotfiles.
- run the command `stow nvim` and it will automatically create the symlink to the `~/.config/nvim`.
- and just like that, the configuration for nvim is already applied.
