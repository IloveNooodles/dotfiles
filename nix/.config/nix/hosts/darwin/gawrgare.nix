{ config, pkgs, pkgs-stable, pkgs-unstable, ... }:
{
  # Host-specific configuration for "gawrgare" (work machine)
  system.primaryUser = "rahman.muhammad";
  
  # Add host-specific packages if needed
  # environment.systemPackages = [
  #   pkgs.some-work-specific-tool
  # ];
  
  # Add host-specific settings here
}
