{config, pkgs, ...}:
{
	imports = [
		./bash.nix
		./kitty.nix
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
		starship.enable = true;
		fzf.enable = true;
		neovim = {
			enable = true;
			defaultEditor = true;
		};
		quickshell.enable = true;
	};
}
