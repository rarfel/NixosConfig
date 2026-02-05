{config, pkgs, ...}:
{
	programs.swaylock = {
		enable = true;
		settings = {
			color = "780078";
			font-size = 24;
			indicator-idle-visible = true;
			indicator-radius = 110;
			line-color = "007800";
			show-failed-attempts = true;
		};
	};
}
