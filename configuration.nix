{ config, pkgs, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "rarnote"; # Define your hostname.
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
	services.xserver.enable = true;

	# Enable the GNOME Desktop Environment.
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "br";
		variant = "thinkpad";
	};

	# Configure console keymap
	console.keyMap = "br-abnt2";

	# Enable bluetooth
	hardware.bluetooth.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	
	# Enables the bash to do his thing
	programs.bash = {
		enable = true;

		enableLsColors = true;

		completion.enable = true;

		# Aliases
		shellAliases = {
			# Shortcut for ls
			la = "ls -a";
			ll = "ls -l";

			# Color the grep
			grep = "grep --color=auto";

			# Shortcut to open kitty conf file
			kitconf = "nvim ~/.config/kitty";

			# Shortcut to open this config file
			nixconf = "sudo nvim /etc/nixos/configuration.nix";
		};

		# Scripts to run in init
		interactiveShellInit = "fastfetch";
	};

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
		packages = with pkgs; [
			#  thunderbird
		];
	};

	# Install firefox.
	programs.firefox.enable = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget

	environment.systemPackages = with pkgs; [
		neovim
		git
		wget
		sl
		cbonsai
		cmatrix
		kitty
		fzf
		starship
		btop
		bat
		cmake
		gcc_multi
		gdb
		fastfetch
		heroic
		obsidian
	];

	# Enable starship to do whatever it needs to do
	programs.starship = {
		enable = true;
	};

	# Enable neovim
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	# Enable git
	programs.git = {
		enable = true;
		config = {
			user.name = "rarfel";
			user.email = "faelmvitor@gmail.com";
			init.defaultBranch = "main";
			pull.rebase = true;
		};
	};

	# Changing defaults
	environment.sessionVariables = {
		EDITOR = "nvim";
		BROWSER = "firefox";
		TERMINAL = "kitty";
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?
}
