{config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		niri
		xwayland-satellite

		fuzzel
		swaybg
		swaylock
	];

	programs.niri.enable = true;
}
