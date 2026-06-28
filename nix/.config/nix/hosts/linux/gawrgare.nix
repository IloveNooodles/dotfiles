{ config, pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  home.username = "gawrgare";
  home.homeDirectory = "/home/gawrgare";

  # Define your Linux packages directly here for now to get it working
  home.packages = [
    # Applications & Languages
    pkgs-unstable.gcc
    pkgs-unstable.go
    pkgs-unstable.zig
    pkgs-unstable.rust-bin.stable.latest.default

    # CLI Tools
    pkgs.bat
    pkgs.eza
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.zoxide
    pkgs.git
    pkgs.tmux
  ];

  # Let Home Manager manage your shell profile hooks natively
  programs.home-manager.enable = true;

  # State version anchoring
  home.stateVersion = "25.11";
  # environment.systemPackages = [
  #   pkgs.some-work-specific-tool
  # ];
  
  # Add host-specific settings here
}
