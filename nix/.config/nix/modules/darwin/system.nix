{ config, pkgs, ... }:
{
  # Darwin-specific system configuration
  
  # Platform configuration for macOS
  nixpkgs = {
    hostPlatform = "aarch64-darwin";  # Apple Silicon (M1/M2/M3)
    # For Intel Mac, use: "x86_64-darwin"
  };
}
