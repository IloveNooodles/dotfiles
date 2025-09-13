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
          pkgs.obsidian

          # Programming languages
          pkgs.ansible

          # Utilization
          # pkgs.obs-studio

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
          pkgs.vscode

          # VSCode plugins
        ];

      # extensions = with pkgs.vscode-extensions; [
      #   13xforever.language-x86-64-assembly
      #   4ops.terraform
      #   aaron-bond.better-comments
      #   adpyke.codesnap
      #   ahmadalli.vscode-nginx-conf
      #   alefragnani.project-manager
      #   antfu.unocss
      #   anthropic.claude-code
      #   apollographql.vscode-apollo
      #   asvetliakov.vscode-neovim
      #   batisteo.vscode-django
      #   bmewburn.vscode-intelephense-client
      #   bradlc.vscode-tailwindcss
      #   christian-kohler.path-intellisense
      #   circleci.circleci
      #   cschlosser.doxdocgen
      #   dart-code.dart-code
      #   dart-code.flutter
      #   dbaeumer.vscode-eslint
      #   donjayamanne.githistory
      #   donjayamanne.python-extension-pack
      #   eamodio.gitlens
      #   ecmel.vscode-html-css
      #   equinusocio.vsc-material-theme
      #   esbenp.prettier-vscode
      #   firsttris.vscode-jest-runner
      #   formulahendry.auto-close-tag
      #   formulahendry.auto-rename-tag
      #   formulahendry.code-runner
      #   github.vscode-github-actions
      #   golang.go
      #   graphql.vscode-graphql
      #   graphql.vscode-graphql-syntax
      #   gruntfuggly.todo-tree
      #   hashicorp.terraform
      #   james-yu.latex-workshop
      #   janisdd.vscode-edit-csv
      #   jeff-hykin.better-cpp-syntax
      #   justusadam.language-haskell
      #   kamikillerto.vscode-colorize
      #   kevinrose.vsc-python-indent
      #   mechatroner.rainbow-csv
      #   mgmcdermott.vscode-language-babel
      #   mhutchie.git-graph
      #   mquandalle.graphql
      #   mrmlnc.vscode-autoprefixer
      #   mrmlnc.vscode-scss
      #   ms-azuretools.vscode-docker
      #   ms-kubernetes-tools.vscode-kubernetes-tools
      #   ms-python.autopep8
      #   ms-python.debugpy
      #   ms-python.isort
      #   ms-python.python
      #   ms-python.vscode-pylance
      #   ms-vscode-remote.remote-containers
      #   ms-vscode-remote.remote-ssh
      #   ms-vscode-remote.remote-ssh-edit
      #   ms-vscode-remote.remote-wsl
      #   ms-vscode-remote.vscode-remote-extensionpack
      #   ms-vscode.cmake-tools
      #   ms-vscode.cpptools
      #   ms-vscode.cpptools-extension-pack
      #   ms-vscode.cpptools-themes
      #   ms-vscode.hexeditor
      #   ms-vscode.makefile-tools
      #   ms-vscode.remote-explorer
      #   ms-vscode.remote-server
      #   ms-vscode.vscode-typescript-next
      #   ms-vsliveshare.vsliveshare
      #   njpwerner.autodocstring
      #   octref.vetur
      #   oderwat.indent-rainbow
      #   orta.vscode-twoslash-queries
      #   pkief.material-icon-theme
      #   redhat.java
      #   redhat.vscode-yaml
      #   ritwickdey.liveserver
      #   rust-lang.rust-analyzer
      #   shopify.ruby-extensions-pack
      #   shopify.ruby-lsp
      #   sibiraj-s.vscode-scss-formatter
      #   svelte.svelte-vscode
      #   tobias-z.vscode-harpoon
      #   twxs.cmake
      #   unifiedjs.vscode-mdx
      #   usernamehw.errorlens
      #   visualstudioexptteam.intellicode-api-usage-examples
      #   visualstudioexptteam.vscodeintellicode
      #   vscjava.vscode-gradle
      #   vscjava.vscode-java-debug
      #   vscjava.vscode-java-pack
      #   vscjava.vscode-java-test
      #   vspacecode.whichkey
      #   vue.volar
      #   wholroyd.jinja
      #   xabikos.javascriptsnippets
      #   xdebug.php-debug
      #   yoavbls.pretty-ts-errors
      #   yzhang.markdown-all-in-one
      #   zainchen.json
      #   ziglang.vscode-zig
      #   zignd.html-css-class-completion
      #   zxh404.vscode-proto3
      # ];

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
          "outerbase-studio"
          "orbstack"
          "cursor"
          "kindavim"
          "keycastr"
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

        primaryUser = "gawrgare";
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
