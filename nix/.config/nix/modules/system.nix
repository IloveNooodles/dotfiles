{ config, pkgs, pkgs-unstable, ... }:
{
  # Used for rust :(, apparently it didn't check the pkg-config build
  environment.variables.PKG_CONFIG_PATH = pkgs.lib.concatStringsSep ":" [
    "${pkgs.libyaml.dev}/lib/pkgconfig"
    "${pkgs.sqlite.dev}/lib/pkgconfig"
    "${pkgs.libpq.dev}/lib/pkgconfig"
    "${pkgs.libmysqlclient.dev}/lib/pkgconfig"
  ];
  environment.variables.LIBRARY_PATH = pkgs.lib.concatStringsSep ":" [
    "${pkgs.libiconv}/lib"
    "${pkgs.sqlite}/lib"
  ];

  # Nix settings
  nix.settings = {
    experimental-features = "nix-command flakes";
    substituters = [ 
      "https://cache.nixos.org" 
      "https://nix-community.cachix.org" 
    ];
    trusted-public-keys = [ 
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" 
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="  
    ];
  };

  # Enable alternative shell support
  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
  };

  # System configuration
  system = {
    stateVersion = 6;
  };

  # Platform configuration
  # Note: hostPlatform is set automatically by nix-darwin based on the system
  # For NixOS (Linux), it would be set in the host-specific config
  nixpkgs = {
    config.allowUnfree = true;
  };
}
