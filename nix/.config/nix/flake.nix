{
  description = "gawrgare nix-system flakes";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-stable";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    rust-overlay.url = "github:oxalica/rust-overlay";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs-unstable, nixpkgs-stable, mac-app-util, nix-homebrew, rust-overlay, home-manager, ... }:
  let
    # Import overlays
    overlays = import ./overlays/default.nix { inherit rust-overlay; };
    
    # Helper function to create package sets for any system
    mkPkgs = system: {
      stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
        overlays = overlays;
      };
      
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
        overlays = overlays;
      };
    };
    
    # Create package sets for macOS (Apple Silicon)
    pkgsMacOS = mkPkgs "aarch64-darwin";
    pkgsLinux = mkPkgs "x86_64-linux";

  in
  {
    darwinConfigurations."gawrgare" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        pkgs-stable = pkgsMacOS.stable;
        pkgs-unstable = pkgsMacOS.unstable;
      };
      modules = [
        # Shared modules
        ./modules/packages.nix
        ./modules/system.nix
        
        # Darwin-specific modules
        ./modules/darwin/system.nix
        ./modules/darwin/homebrew.nix
        
        # Host-specific configuration
        ./hosts/darwin/gawrgare.nix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "rahman.muhammad";
            autoMigrate = true;
          };
        }
        mac-app-util.darwinModules.default
      ];
    };

    darwinPackages = self.darwinConfigurations."gawrgare".pkgs;
  
    darwinConfigurations."gawrgare-home" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        pkgs-stable = pkgsMacOS.stable;
        pkgs-unstable = pkgsMacOS.unstable;
      };
      modules = [
        # Shared modules
        ./modules/packages.nix
        ./modules/system.nix
        
        # Darwin-specific modules
        ./modules/darwin/system.nix
        ./modules/darwin/homebrew.nix
        
        # Host-specific configuration
        ./hosts/darwin/gawrgare-home.nix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "gawrgare";
            autoMigrate = true;
          };
        }
        mac-app-util.darwinModules.default
      ];
    };

    homeConfigurations."gawrgare" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsLinux.stable;
      extraSpecialArgs = {
        pkgs-stable = pkgsLinux.stable;
        pkgs-unstable = pkgsLinux.unstable;
      };
      modules = [
        ./modules/linux/packages.nix
        ./hosts/linux/gawrgare.nix
      ];
    };
  };
}
