{ config, pkgs, ... }:

{
  home.username = "rarfel";
  home.homeDirectory = "/home/rarfel";

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
    # "Xcursor.size" = 16;
    # "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    fastfetch
    nnn # terminal file manager

    # archives
    # zip
    # xz
    # unzip
    # p7zip

    # utils
    # ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processor https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

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
    # which
    # tree
    # gnused
    # gnutar
    # gawk
    # zstd
    # gnupg
    cbonsai
    cmatrix
    starship
    sl
    heroic

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

    # Text
    neovim
    obsidian
    bat

    # Code
    cmake
    gcc_multi
    gdb
    git
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings.user = {
      name = "rarfel";
      email = "faelmvitor@gmail.com";
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      # fonts
      font_family      JetBrainsMonoNLNerdFont
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size 11.0

      # window
      remember_window_size no
      initial_window_width 1150
      initial_window_height 600
      hide_window_decorations yes

      # cursor
      cursor_trail 200
      cursor_trail_decay 0.1 0.4
      cursor_trail_start_treshold 2

      # color scheme
      foreground #c98ec9
      background #000000
      background_opacity 0.8

      #: black
      color0 #100010
      color8 #500050

      #: red
      color1 #ee0000
      color9 #780000 

      #: green
      color2  #00ee00
      color10 #007800

      #: yellow
      color3  #eeee00
      color11 #995700

      #: blue
      color4  #0000ee
      color12 #000078

      #: magenta
      color5  #d800d8
      color13 #780078

      #: cyan
      color6  #00eeee
      color14 #00bdbd

      #: white
      color7  #eeaeee
      color15 #ffbfff
      '';
    };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      la = "ls -a";
      ll = "ls -l";

      grep = "grep --color=auto";

      kitconf = "nvim ~/.config/kitty";

      nixconf = "sudo nvim /etc/nixos";
    };

  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
