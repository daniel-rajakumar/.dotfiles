{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "dani";
  home.homeDirectory = "/home/dani";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  nixpkgs.config.allowUnfree = true;



  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
  home.packages = with pkgs; [
    #browser
    firefox

    # editors
    vim
    neovim
    vscode

    # terminal
    kitty

    # WM
    sxhkd
    nitrogen
    polybar
    rofi
    dunst
    notify-desktop

    # other
    discord
    megasync
    picom
    fusuma
    # libinput
    # libinput-gestures
    xdotool
    pamixer
    qalculate-gtk

    # tools
    wget
    neofetch
    flameshot
    git
    yadm
    killall
    gnome3.gnome-keyring
    qtkeychain
    playerctl
    wirelesstools
    bluez
    plasma-browser-integration
    # bluetoothctl

    # langs
    # ruby

  ];

 
}
