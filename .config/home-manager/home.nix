{ config, pkgs, ... }:

{
  home.username = "lynk";
  home.homeDirectory = "/home/lynk";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    ripgrep
    tree-sitter

    zsh-powerlevel10k
    zsh-autosuggestions
    zsh-syntax-highlighting

    lua-language-server

    awscli2
    kubectl
    kubernetes-helm
    terragrunt
    terraform
    k9s
    azure-cli
    google-cloud-sdk

    signal-desktop
    discord
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;
      systemd.enable = true;

      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-unikey
        qt6Packages.fcitx5-configtool
      ];

      settings = {
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };
          "Groups/0/Items/1" = {
            Name = "unikey";
            Layout = "";
          };
          GroupOrder."0" = "Default";
        };

        addons.unikey.globalSection = {
          InputMethod = "Telex";
          OutputCharset = "Unicode";
        };
      };
    };
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "Internet Messenger";
    icon = "discord";
    terminal = false;

    exec = "env -u WAYLAND_DISPLAY NIXOS_OZONE_WL=0 ${pkgs.discord}/bin/discord --ozone-platform=x11 %U";

    categories = [
      "Network"
      "InstantMessaging"
    ];

    mimeType = [
      "x-scheme-handler/discord"
    ];

    settings = {
      StartupWMClass = "discord";
    };
  };

  programs.home-manager.enable = true;
}
