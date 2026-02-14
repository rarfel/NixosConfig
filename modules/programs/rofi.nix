{config, pkgs, ...}:
{
	programs.rofi = {
		enable = true;
		font = "JetBrainsMonoNLNerdFont 11";
		terminal = "kitty";
		theme = "Arc-Dark";

		extraConfig = {
		modi = "drun,run,window,ssh,combi,keys,filebrowser";
		show-icons = true;
		drun-display-format = "{icon} {name}";
		};
	};
}
