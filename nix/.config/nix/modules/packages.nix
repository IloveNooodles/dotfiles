args@{ pkgs, pkgs-stable, pkgs-unstable, ... }:
let
  packages = [
    # Programming languages (from unstable for latest versions)
    pkgs-unstable.ansible
    pkgs-unstable.gcc
    pkgs-unstable.beamPackages.elixir
    pkgs-unstable.gleam
    pkgs-unstable.scala
    pkgs-unstable.lua
    pkgs-unstable.go
    pkgs-unstable.bun
    pkgs-unstable.zig
    pkgs-unstable.rust-bin.stable.latest.default

    # CLI tools (from stable)
    pkgs.bat
    pkgs.eza
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.zoxide
    pkgs.just
    pkgs.delta

    # Tools (from stable)
    pkgs.awscli2
    pkgs.terraform
    pkgs.ffmpeg
    pkgs.gitleaks
    pkgs.stow
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.kubectl
    pkgs.k9s
    pkgs.mise
    pkgs.tmux
    pkgs.tmuxifier
    pkgs.starship
    pkgs.talosctl
    pkgs.go-task
    pkgs.ast-grep
    pkgs.nil
    pkgs.asciinema
    pkgs.croc
    pkgs.ttyd
    pkgs.jrnl
    pkgs.newsboat
    pkgs.gnuplot
    pkgs.graphviz
    pkgs.coursier
    pkgs.gh
    pkgs.github-copilot-cli
    pkgs.rust-analyzer
    pkgs.prek
    pkgs.tree-sitter
    pkgs.opencode
    pkgs.gemini-cli

    # Dependencies
    pkgs.libyaml
  ];
in
# ponytail: dual-use — nix-darwin module when `lib` is in args, plain list otherwise
if args ? lib then
  { environment.systemPackages = packages; }
else
  packages
