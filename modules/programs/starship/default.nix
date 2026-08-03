{config, pkgs, ...}:
{
  xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  programs.starship.enable = true;
}
