{config, pkgs, ...}:
{
	imports = [
		./bash.nix
		./kitty
		./nvim
		./rofi
    ./starship
    ./noctalia
	];
	
	programs.git = {
		enable = true;
		settings.user = {
			name = "rarfel";
			email = "faelmvitor@gmail.com";
		};
	};

	programs = {
    obsidian.enable = true;
		fzf.enable = true;
		eza.enable = true;
		cava.enable = true;
		quickshell.enable = true;
	};
}
