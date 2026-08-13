{ config, pkgs, inputs, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
		/etc/nixos/hardware-configuration.nix
    ./modules/programs/steam.nix
    ./modules/programs/sddm.nix
    ./modules/programs/fonts.nix
    ./modules/programs/nix-alien.nix
	];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Enable networking
	networking.networkmanager.enable = true;

	# Enable experimental features
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Set your time zone.
	time.timeZone = "America/Sao_Paulo";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pt_BR.UTF-8";
		LC_IDENTIFICATION = "pt_BR.UTF-8";
		LC_MEASUREMENT = "pt_BR.UTF-8";
		LC_MONETARY = "pt_BR.UTF-8";
		LC_NAME = "pt_BR.UTF-8";
		LC_NUMERIC = "pt_BR.UTF-8";
		LC_PAPER = "pt_BR.UTF-8";
		LC_TELEPHONE = "pt_BR.UTF-8";
		LC_TIME = "pt_BR.UTF-8";
	};

	# Enable the X11 windowing system.
	#services.xserver.enable = true;

	# use both wayland and x11
	services = {
    desktopManager.plasma6.enable = true;
    # selecting niri as default display manager to avoid conflict
    displayManager.defaultSession = pkgs.lib.mkForce "niri";
	};

	# Enable pam security and polkit
	security = {
		pam.services.swaylock = {
			text = ''
				auth include login
			'';
		};
		polkit.enable = true;
	};

	# Enable automount
	services = {
		gvfs.enable = true;
		udisks2.enable = true;
		devmon.enable = true;
	};

	# Configure keymap in X11.
	services.xserver.xkb = {
		layout = "br";
		variant = "thinkpad";
	};

	# enable mysql
	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

	# Configure console keymap
	console.keyMap = "br-abnt2";

	# Enable bluetooth
	hardware.bluetooth.enable = true;

	# Enable OpenGL
	hardware.graphics.enable = true;

	# Automatic updating
	system.autoUpgrade = {
		enable = true;
		dates = "weekly";
	};

	# Auto clean up
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = "--delete-older-than 15d";
	};
	nix.settings.auto-optimise-store = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# Enable swapfiles
	swapDevices = [{
		device = "/swapfile";
		size = 8 * 1024; # 8GB
	}];
	
	# Enable CUPS to print documents. I dont have a printer
	services.printing.enable = false;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};
	
	# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.rarfel = {
		isNormalUser = true;
		description = "rarfel";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	# Define database user;
	users.users.dbuser = {
		isNormalUser = true;
		description = "dbuser";
		extraGroups = [ "networkmanager" "wheel" ];
	};

  # Enable compatibility layer to work with mason
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
  ];

  # Enable global appimage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

	# Install firefox.
	programs.firefox.enable = true;

	environment.systemPackages = with pkgs; [
		neovim
		git
		wget
		cbonsai
		cmatrix
		kitty
		fzf
		starship
		bat
		fastfetch
		mesa-demos
		maven
    distrobox
    docker
		inputs.quickshell.packages.${stdenv.hostPlatform.system}.default
		inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
	];

  # Enable docker
  virtualisation.docker.enable = true;

  # Disable case sensitive
	environment.etc.inputrc.text = ''
		set completion-ignore-case on
	'';

  # removing some kde default apps
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    qrca
    kate
    okular
    spectacle
  ];

	system.stateVersion = "25.11"; # Did you read the comment?
}
