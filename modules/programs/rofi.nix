{config, pkgs, ...}:
{
	programs.rofi = {
		enable = true;
		font = "FiraCode Nerd Font 12";
		terminal = "kitty";
		theme = "Arc-Dark";

		extraConfig = {
		  modi = "drun,run,window,ssh,combi,keys,filebrowser";
		  show-icons = true;
		  drun-display-format = "{icon} {name}";
		};
	};
}
