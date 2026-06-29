{ pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  home.packages = import ../packages.nix { inherit pkgs pkgs-stable pkgs-unstable; };
}
