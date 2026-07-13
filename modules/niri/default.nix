{config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		niri
		xwayland-satellite
		wayland
		wayland-protocols
		wayland-scanner
		wayland-utils
		#libxkbcommon
		pkg-config

		rofi
		#swaybg
	];
	programs = {
		niri.enable = true;
	};
}
