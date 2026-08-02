{config, pkgs, ...}:
{
  xdg.configFile."nvim".source = ./config;
  neovim = {
		enable = true;
		defaultEditor = true;
    withRuby = true;
    withPython3 = true;
	};
}
