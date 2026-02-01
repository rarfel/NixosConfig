{pkgs, ...}:

{
	programs.bash = {
		enable = true;
		enableCompletion = true;

		shellAliases = {
			la = "ls -a";
			ll = "ls -l";

			grep = "grep --color=auto";

			nixconf = "cd ~/Programacao/nixos";
		};
		initExtra = "eval \"(fzf --bash)\"; fastfetch";
	};
}
