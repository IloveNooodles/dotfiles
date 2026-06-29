{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = [
    #pkgs-unstable.wezterm
    pkgs-unstable.neovim
    pkgs.wezterm
    pkgs.obsidian
  ];
}
