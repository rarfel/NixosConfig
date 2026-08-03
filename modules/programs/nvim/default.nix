{config, pkgs, ...}:
{
  xdg.configFile."nvim".source = ./config;
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
  	withRuby = true;
  	withPython3 = true;
  };
}
