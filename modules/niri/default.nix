{config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		niri
		xwayland-satellite

		rofi
		swaybg
	];
	programs = {
		niri.enable = true;
		};
}
