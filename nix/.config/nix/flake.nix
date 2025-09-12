{
  description = "gawrgare nix-system flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew, ... }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          # Applications
          pkgs.wezterm
          pkgs.neovim
          pkgs.postman

          # Programming languages
          pkgs.ansible

          # Utilization

          # Rust linux tools
          pkgs.bat
          pkgs.eza
          pkgs.fzf
          pkgs.ripgrep
          pkgs.fd

          # Tools
          pkgs.awscli2
          pkgs.direnv
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
        ];

      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
        };

        brews = [
          "circleci"
          "helm"
        ];

        casks = [
          "snipaste"
        ];
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 6;

        primaryUser = "rahman.muhammad";
      };

      # The platform the configuration will be used on.
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config.allowUnfree = true;
      };
    };
  in
  {
    darwinConfigurations."gawrgare" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
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
  };
}
