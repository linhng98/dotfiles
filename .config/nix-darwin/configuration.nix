{ pkgs, pkgs-unstable, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim
    neovim
    meslo-lgs-nf
    nerd-fonts.meslo-lg
    zsh-autosuggestions
    fzf
    go
    jq
    k9s
    kubectl
    kustomize
    ripgrep
    python314
    unzip
    uv
    lua-language-server
    nodePackages.typescript-language-server
    rustup
    kubernetes-helm
    tree
    awscli2
    azure-cli
    nodejs_24
    prettier
    hclfmt
    black

    pkgs-unstable.opencode
    pkgs-unstable.codex
    pkgs-unstable.playwright-mcp
    pkgs-unstable.mcp-grafana
  ];

  # Necessary for using flakes on this system
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.primaryUser = "linhnv";

  system.defaults.dock = {
    autohide = true;
    tilesize = 32;
  };

  system.defaults.NSGlobalDomain = {
    KeyRepeat = 2;      # 120, 90, 60, 30, 12, 6, 2
    InitialKeyRepeat = 15; # 120, 94, 68, 35, 25, 15
  };
  system.stateVersion = 6;

  homebrew = {
    enable = true;
    brews = [
      "gpg"
      "pinentry-mac"
    ];
    casks = [
      "google-chrome"
      "orbstack"
      "kitty"
      "obsidian"
      "signal"
      "slack"
      "postman"
    ];
  };

  # The platform the configuration will be used on
  nixpkgs.hostPlatform = "aarch64-darwin";
}
