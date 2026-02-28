{ config, pkgs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    brews = [
      "circleci"
      "helm"
      "libyaml"
      "sketchybar"
      "uv"
      "bruno"
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
      "aerospace"
      "font-hack-nerd-font"
      "headlamp"
    ];

    masApps = {
      "RunCat" = 1429033973;
      "Bitwarden" = 1352778147; 
    };
  };
}
