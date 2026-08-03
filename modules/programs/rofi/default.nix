{config, pkgs, ...}:
{
  xdg.configFile."rofi".source = ./config;
	programs.rofi = {
		enable = true;
		terminal = "kitty";
	};
}
