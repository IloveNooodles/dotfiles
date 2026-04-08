{ pkgs, config, pkgs-stable, pkgs-unstable, ... }:
{
  environment.systemPackages =
    let
      # VS Code with extensions (from stable for better cache hits)
      vscode = pkgs-stable.vscode-with-extensions.override {
        vscodeExtensions = with pkgs-stable.vscode-extensions; [
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
          # FIXME: These extensions are not available in nixpkgs
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
      pkgs-unstable.wezterm
      pkgs-unstable.neovim
      pkgs.obsidian

      # Programming languages (from unstable for latest versions)
      pkgs-unstable.ansible
      pkgs-unstable.gcc
      pkgs-unstable.elixir
      pkgs-unstable.lua
      pkgs-unstable.go
      pkgs-unstable.bun
      pkgs-unstable.zig
      pkgs-unstable.rust-bin.stable.latest.default

      # Rust linux tools (from stable)
      pkgs.bat
      pkgs.eza
      pkgs.fzf
      pkgs.ripgrep
      pkgs.fd
      pkgs.zoxide
      pkgs.just
      pkgs.delta

      # Tools (from stable)
      pkgs.awscli2
      pkgs.terraform
      pkgs-unstable.direnv
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
      pkgs.go-task
      pkgs.ast-grep
      pkgs.nil
      pkgs.asciinema
      pkgs.croc
      pkgs.ttyd
      pkgs.jrnl
      pkgs.newsboat
      pkgs.gnuplot
      pkgs.graphviz
      pkgs.coursier
      pkgs.gh
      pkgs.rust-analyzer
      pkgs.prek
      vscode

      # Dependencies
      pkgs.libyaml
    ];
}
