{config, pkgs, ...}:
{
  xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  programs.kitty = {
    enable = true;
}
