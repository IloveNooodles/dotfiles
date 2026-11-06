{ pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  # Stow owns the dotfiles; Home Manager only installs packages.
  home.packages = (import ../packages.nix { inherit pkgs pkgs-stable pkgs-unstable; })
    ++ (with pkgs-unstable; [
      # Shell and editor; configuration remains managed by Stow.
      fish
      neovim

      # Linux CLI equivalents of modules/darwin/homebrew.nix only.
      # libyaml, kubectl and talosctl are already in the shared list.
      circleci-cli
      kubernetes-helm
      uv
      direnv
      datadog-pup
      herdr
      jujutsu
      rtk
      worktrunk
      omnictl
      kubelogin-oidc

      # CLI tools distributed as casks on macOS.
      codex
      github-copilot-cli
    ]);
}
