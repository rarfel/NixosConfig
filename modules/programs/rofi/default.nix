{config, pkgs, ...}:
{
  xdg.configFile."rofi".source = ./config;
	programs.rofi = {
		enable = true;
		settings.terminal = "kitty";
	};
}
