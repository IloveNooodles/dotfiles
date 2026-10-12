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
    pkgs-unstable.diesel-cli

    # CLI tools (from stable)
    pkgs.bat
    pkgs.eza
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.zoxide
    pkgs.just
    pkgs.delta

    # CLI tools (from unstable)
    pkgs-unstable.lazygit
    pkgs-unstable.lazydocker
    pkgs-unstable.ast-grep
    pkgs-unstable.prek
    pkgs-unstable.trivy
    pkgs-unstable.popeye
    pkgs-unstable.oha
    pkgs-unstable.cmctl

    # Tools (from stable)
    pkgs.awscli2
    pkgs.terraform
    pkgs.ffmpeg
    pkgs.gitleaks
    pkgs.stow
    pkgs.kubectl
    pkgs.k9s
    pkgs.mise
    pkgs.tmux
    pkgs.tmuxifier
    pkgs.starship
    pkgs.talosctl
    pkgs.go-task
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
    pkgs.rust-analyzer
    pkgs.tree-sitter
    pkgs.sqlite

    # AI tools (from unstable)
    # pkgs-unstable.github-copilot-cli
    pkgs-unstable.opencode
    pkgs-unstable.gemini-cli
    # pkgs-unstable.codex

    # Dependencies
    pkgs.libyaml
    pkgs.libmysqlclient
    pkgs.libpq
    pkgs.libiconv
    pkgs.pkg-config
    pkgs.gnumake
  ];
in
# ponytail: dual-use — nix-darwin module when `lib` is in args, plain list otherwise
if args ? lib then
  { environment.systemPackages = packages; }
else
  packages
