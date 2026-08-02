{config, pkgs, ...}:
{
  imports =[
    ./noctalia.nix
  ];
	environment.systemPackages = with pkgs; [
		niri
		xwayland-satellite
		wayland
		wayland-protocols
		wayland-scanner
		wayland-utils
		pkg-config

		rofi
	];
	programs = {
		niri.enable = true;
	};
}
