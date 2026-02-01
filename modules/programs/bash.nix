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
		initExtra = "fastfetch";
	};
}
