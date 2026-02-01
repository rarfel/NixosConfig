{config, pkgs, ...}:

{
	programs.bash = {
		enable = true;
		enableCompletion = true;

		shellAliases = {
			la = "ls -a";
			ll = "ls -l";

			grep = "grep --color=auto";

			gacp = "git add .; git commit -m \"$1\"; git push -u origin main";

			nixconf = "cd /etc/nixos/ ;sudo nvim .";
		};
		initExtra = "fastfetch";
	};
}
