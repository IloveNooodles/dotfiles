{ config, pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  home.username = "gawrgare";
  home.homeDirectory = "/home/gawrgare";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
