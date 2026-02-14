{config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		niri
		xwayland-satellite

		rofi
		swaybg
		swaylock
		# swayidle
	];
	programs = {
		niri.enable = true;
		};
}
