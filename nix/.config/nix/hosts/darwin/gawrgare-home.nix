{ config, pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  # Host-specific configuration for "gawrgare-home" (home machine)
  system.primaryUser = "gawrgare";
  
  # Add host-specific packages if needed
  # environment.systemPackages = [
  #   pkgs.some-home-specific-tool
  # ];
  
  # Add host-specific settings here
}
