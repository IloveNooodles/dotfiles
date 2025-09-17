{
  description = "gawrgare nix-system flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew, rust-overlay, ... }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        let
          vscode = pkgs.vscode-with-extensions.override {
            vscodeExtensions = with pkgs.vscode-extensions; [
              aaron-bond.better-comments
              adpyke.codesnap
              alefragnani.project-manager
              apollographql.vscode-apollo
              asvetliakov.vscode-neovim
              batisteo.vscode-django
              bmewburn.vscode-intelephense-client
              bradlc.vscode-tailwindcss
              christian-kohler.path-intellisense
              dart-code.dart-code
              dart-code.flutter
              dbaeumer.vscode-eslint
              donjayamanne.githistory
              eamodio.gitlens
              ecmel.vscode-html-css
              esbenp.prettier-vscode
              firsttris.vscode-jest-runner
              formulahendry.auto-close-tag
              formulahendry.auto-rename-tag
              formulahendry.code-runner
              github.vscode-github-actions
              golang.go
              graphql.vscode-graphql
              graphql.vscode-graphql-syntax
              gruntfuggly.todo-tree
              hashicorp.terraform
              james-yu.latex-workshop
              justusadam.language-haskell
              kamikillerto.vscode-colorize
              mechatroner.rainbow-csv
              mhutchie.git-graph
              ms-azuretools.vscode-docker
              ms-kubernetes-tools.vscode-kubernetes-tools
              ms-python.debugpy
              ms-python.isort
              ms-python.python
              ms-python.vscode-pylance
              ms-vscode-remote.remote-containers
              ms-vscode-remote.remote-ssh
              ms-vscode-remote.remote-ssh-edit
              ms-vscode-remote.remote-wsl
              ms-vscode-remote.vscode-remote-extensionpack
              ms-vscode.cmake-tools
              ms-vscode.cpptools
              ms-vscode.cpptools-extension-pack
              ms-vscode.hexeditor
              ms-vscode.makefile-tools
              ms-vscode.remote-explorer
              ms-vsliveshare.vsliveshare
              njpwerner.autodocstring
              octref.vetur
              oderwat.indent-rainbow
              pkief.material-icon-theme
              redhat.java
              redhat.vscode-yaml
              ritwickdey.liveserver
              rust-lang.rust-analyzer
              shopify.ruby-lsp
              svelte.svelte-vscode
              twxs.cmake
              unifiedjs.vscode-mdx
              usernamehw.errorlens
              visualstudioexptteam.intellicode-api-usage-examples
              visualstudioexptteam.vscodeintellicode
              vscjava.vscode-gradle
              vscjava.vscode-java-debug
              vscjava.vscode-java-pack
              vscjava.vscode-java-test
              vspacecode.whichkey
              vue.volar
              wholroyd.jinja
              xdebug.php-debug
              yoavbls.pretty-ts-errors
              yzhang.markdown-all-in-one
              zainchen.json
              ziglang.vscode-zig
              zxh404.vscode-proto3
              # FIXME
              # 13xforever.language-x86-64-assembly
              # 4ops.terraform
              # ahmadalli.vscode-nginx-conf
              # antfu.unocss
              # anthropic.claude-code
              # circleci.circleci
              # cschlosser.doxdocgen
              # donjayamanne.python-extension-pack
              # equinusocio.vsc-material-theme
              # janisdd.vscode-edit-csv
              # jeff-hykin.better-cpp-syntax
              # kevinrose.vsc-python-indent
              # mgmcdermott.vscode-language-babel
              # mquandalle.graphql
              # mrmlnc.vscode-autoprefixer
              # mrmlnc.vscode-scss
              # ms-python.autopep8
              # ms-vscode.cpptools-themes
              # ms-vscode.remote-server
              # ms-vscode.vscode-typescript-next
              # orta.vscode-twoslash-queries
              # shopify.ruby-extensions-pack
              # sibiraj-s.vscode-scss-formatter
              # tobias-z.vscode-harpoon
              # xabikos.javascriptsnippets
              # zignd.html-css-class-completion
            ];
          };
        in
        [
          # Applications
          pkgs.wezterm
          pkgs.neovim
          pkgs.postman
          pkgs.obsidian

          # Programming languages
          pkgs.ansible
          pkgs.gcc
          pkgs.elixir
          pkgs.lua
          pkgs.bun
          pkgs.zig
          pkgs.go
          pkgs.rust-bin.stable.latest.default

          # Utilization
          # pkgs.obs-studio

          # Rust linux tools
          pkgs.bat
          pkgs.eza
          pkgs.fzf
          pkgs.ripgrep
          pkgs.fd
          pkgs.zoxide

          # Tools
          pkgs.awscli2
          pkgs.terraform
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
          pkgs.starship
          pkgs.talosctl
          pkgs.pre-commit
          pkgs.go-task
          vscode

          # Dependencies
          pkgs.libyaml
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
          "dbeaver-community"
          "snipaste"
          "outerbase-studio"
          "orbstack"
          "cursor"
          "kindavim"
          "keycastr"
          "tailscale-app"
        ];

        masApps = {
          "RunCat" = 1429033973;
          "Bitwarden" = 1352778147; 
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs = {
        fish.enable = true;
      };

      system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 6;

        primaryUser = "gawrgare";
      };

      # The platform the configuration will be used on.
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        overlays = [ rust-overlay.overlays.default ];
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
  
    darwinConfigurations."gawrgare-home" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
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
  };
}
