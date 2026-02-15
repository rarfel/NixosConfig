{config, pkgs, ...}:

{
	programs.bash = {
		enable = true;
		enableCompletion = true;

		shellAliases = {
			la = "ls -a";
			ll = "ls -l";

			grep = "grep --color=auto";

			nixconf = "cd /etc/nixos/ ;sudo nvim .";
		};
		initExtra = "fastfetch --kitty-direct /home/rarfel/Images/valknutCheio.png --logo-width 35 --logo-height 15";
	};
}
