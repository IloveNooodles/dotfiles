# Nix package manager
>
> [!WARNING]
> Needed to be added in /etc/nix/nix.conf
> experimental-features = nix-command flakes

## How to run

```bash

~ ❯ sudo nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/.config/nix#gawrgare
```

## Missing Command

```sh
code --install-extension anysphere.cursorpyright
code --install-extension anysphere.pyright
code --install-extension evondev.indent-rainbow-palettes
```
