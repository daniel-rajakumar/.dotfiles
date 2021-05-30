# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
 	      enable = true;
        devices = [ "nodev" ];
        efiInstallAsRemovable = true;
        efiSupport = true;
        useOSProber = true;
  };

  networking = { 
  	hostName = "nixos"; # Define your hostname.
        networkmanager.enable = true;
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system# .
  services.xserver = {
 	enable = true;
	displayManager.sddm.enable = true;
	desktopManager.plasma5.enable = true;
	windowManager.bspwm.enable = true;
  };


  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # hardware.enableRedistributableFirmware = true;

#  boot.extraModprobeConfig = ''
#     options snd slots=snd-hda-intel
#     options snd_hda_intel enable=0,1
#   '';

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  programs.light.enable = true;

  virtualisation.virtualbox = {
     host.enable = true;
     # host.enableExtensionPack = true;
     # guest.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dani = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "input" "video" "user-with-access-to-virtualbox" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    # editor = pkgs.vim;
  };




  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ 
   # firefox vim yadm git
  ];




  environment.variables.EDITOR = "nvim";
  environment.variables.JAVA_HOME = "/nix/store/pb1slcapcgn6mrdwpb7bz8qa42w9q8im-openjdk-11.0.9+11/lib/openjdk";
  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";
  # make plasma browser integration work inside chormium brower
  environment.etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";



   programs.java = {
     enable = true;
     package = pkgs.jdk11;

  };


  #fonts
  fonts.fonts = with pkgs; [

     font-awesome-ttf 
     corefonts  # microsoft fonts

     # nerd fonts
     (nerdfonts.override { fonts = [ 
       "CascadiaCode"
     ]; })
  ];


  nixpkgs.config.pulseaudio = true;
  nixpkgs.config.allowUnfree = true; # allow unfree packages



  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  system.stateVersion = "20.09"; # Did you read the comment?

}
