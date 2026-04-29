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
      "datadog-labs/pack"
    ];

    brews = [
      "circleci"
      "helm"
      "libyaml"
      "sketchybar"
      "uv"
      "telepresenceio/telepresence/telepresence-oss"
      "datadog-labs/pack/pup"
      "fish"
      "worktrunk"
      "reattach-to-user-namespace"
      "direnv"
      "rtk"
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
      "bruno"
    ];

    masApps = {
      "RunCat" = 1429033973;
      "Bitwarden" = 1352778147; 
    };
  };
}
