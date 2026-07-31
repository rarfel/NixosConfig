{config, pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # fonts
      font_family      FiraCode Nerd Font
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size 10.5
      disable_ligatures never

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
      background #110011
      background_opacity 0.85

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
      color11 #ff8800

      #: blue
      color4  #0000ee
      color12 #000078

      #: magenta
      color5  #d800d8
      color13 #ab00ab

      #: cyan
      color6  #00eeee
      color14 #00bdbd

      #: white
      color7  #eeaeee
      color15 #ffbfff
      '';
    };
}
