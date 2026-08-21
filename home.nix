{ config, pkgs, ... }:

{
  home.username = "rarfel";
  home.homeDirectory = "/home/rarfel";
  home.stateVersion = "25.11";

  imports = [
    ./modules/programs
  ];

  home.packages = with pkgs; [

    pcmanfm # gui file manager
    lxmenu-data # show installed apps
    shared-mime-info # reconize different file types

    # archives
    unzip
    rar

    # utils
    ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’

    # networking tools
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses
    btop  # replacement of htop/nmon
    # iotop # io monitoring
    iftop # network monitoring

    # draw
    aseprite
    drawy

    # write
    obsidian
    vscode
    # libreoffice
    libreoffice-qt
    hunspell

    # misc
    # cowsay
    which
    # cava
    sl
    heroic
    wine
    # asciiquarium-transparent
    pipes
    pkg-config
    # fireplace
    appimage-run
    steam
   
    # nix related
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
  ];
}
