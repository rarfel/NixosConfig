{ config, pkgs, ... }:

{
  home.username = "rarfel";
  home.homeDirectory = "/home/rarfel";

  imports = [
    ./modules/programs
  ];

  home.packages = with pkgs; [

    nnn # terminal file manager
    pcmanfm # gui file manager
    lxmenu-data # show installed apps
    shared-mime-info # reconize different file types

    # archives
    # zip
    # xz
    unzip
    # p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    # file
    which
    tree
    # gnused
    # gnutar
    # gawk
    # zstd
    # gnupg
    cava
    sl
    heroic
    obsidian
    wine
    asciiquarium-transparent
    # steam

    # libreoffice
    libreoffice-qt
    hunspell

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    # hugo # static site generator
    # glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    # iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    # pciutils # lspci
    # usbutils # lsusb

    # Code
    cmake
    gcc_multi
    gdb
    python315
    javaPackages.compiler.temurin-bin.jre-25
    lua-language-server
    lua54Packages.luarocks
    lua51Packages.lua
    tree-sitter
    vscode
    ghidra
  ];

  home.stateVersion = "25.11";
}
