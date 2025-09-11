# Nix package manager
>
> [!WARNING]
> Needed to be added in /etc/nix/nix.conf
> experimental-features = nix-command flakes

## How to run

```bash

~ ❯ sudo nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/.config/nix#gawrgare
```
