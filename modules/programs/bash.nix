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

		};
		initExtra = "fastfetch --kitty-direct /home/rarfel/Images/valknutCheio.png --logo-width 35 --logo-height 15";
	};
}
