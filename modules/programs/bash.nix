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

			nixconf = "cd /etc/nixos/ ;sudo nvim .";
		};
		initExtra = "fastfetch --kitty-direct /home/rarfel/Images/valknutCheio.png --logo-width 35 --logo-height 15";
	};
}
