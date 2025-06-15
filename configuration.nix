{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernal asus stuff
  boot.kernelModules = [ "asus-nb-wmi" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Mouse settings
  services.libinput = {
    enable = true;
    mouse = {
      sendEventsMode = "enabled";
      naturalScrolling = true;
    };
  };

  # Disable GNOME and GDM, and enable i3 and LightDM.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
    ];
  };

  services.logind = {
		#lidSwitch = "ignore";
    };

  # power management

  services.thermald.enable = true;

  powerManagement.enable = true;

	#programs.asusctl.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
    # Example settings - adjust as needed for your hardware and preferences
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; # For Intel CPUs
    CPU_MIN_PERF_ON_BAT = 0; # Minimum CPU frequency on battery (percentage)
    CPU_MAX_PERF_ON_BAT = 50; # Maximum CPU frequency on battery (percentage)
    # You can also set battery charge thresholds to prolong battery lifespan
    # START_CHARGE_THRESH_BAT0 = 75;
    # STOP_CHARGE_THRESH_BAT0 = 80;
  };
  # If you use a desktop environment that has its own power management (like GNOME's power-profiles-daemon),
  # you might need to disable it to avoid conflicts with TLP.
  # services.power-profiles-daemon.enable = false;

  # Tailscale
  services.tailscale.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "ctrl:swapcaps";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # remap ctrl => capslock
  #services.xserver.xkb.options = "caps:swapctrl";

  # Load nvidia driver for Xorg
  #services.xserver.videoDrivers = ["nvidia"];

  #hardware.nvidia = {
  #  modesetting.enable = true;
  #  powerManagement.enable = false;
  #  powerManagement.finegrained = false;
  #  open = false;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
  #};

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.mack = {
    isNormalUser = true;
    description = "mack";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Steam
  #programs.steam = {
  #enable = true;
  #remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  #};

  # Mouse size for 4k display
  #environment.variables.XCURSOR_SIZE = "64";

  # Allow unfree packages
  nixpkgs.overlays = [ (import /opt/nixpkgs-mozilla/firefox-overlay.nix) ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
		#latest.firefox-nightly-bin
	nodejs
   	vim
	iw
	pulseaudio
   	wget
	asusctl
   	gh
	acpi
	uv
	go
	git
	evince
	python3
   	neovim
	obsidian
	devenv
   	alacritty
	slack
   	unzip
	playerctl
	emacs
   	zsh
	brightnessctl
	zsh-autosuggestions
	zsh-syntax-highlighting
   	lxappearance
   	wezterm
   	gnumake
   	cmake
   	gcc
	tmux
   	luarocks
	btop
	xclip
	flameshot
   	rofi
   	picom
   	feh
	fastfetch
	cargo
	rustc
	rust-analyzer
	rustfmt
	lua-language-server
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # system.stateVersion
  system.stateVersion = "24.11";
}


