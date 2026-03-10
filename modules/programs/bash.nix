{config, pkgs, ...}:

{
	programs.bash = {
		enable = true;
		enableCompletion = true;

		shellAliases = {
			ls = "eza";
			la = "ls -a";
			ll = "ls -l";
			lh = "ls -lah";

			grep = "grep --color=auto";

			ghidra = "_JAVA_AWT_WM_NONREPARENTING=1 ghidra";

			# Crazy workaround to run non-nixos files: alien ./myfile
			alien = "nix run \"github:thiagokokada/nix-alien#nix-alien\" -- ";

		};
		initExtra = "fastfetch --kitty-direct /home/rarfel/Images/valknutCheio.png --logo-width 35 --logo-height 15";
	};
}
