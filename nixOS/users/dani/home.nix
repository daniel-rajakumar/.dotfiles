{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "dani";
  home.homeDirectory = "/home/dani";
  home.stateVersion = "21.03";

  nixpkgs.config.allowUnfree = true;


  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
  home.packages = with pkgs; [
    #browser
    #firefox
    brave

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
    libinput-gestures
    libinput
    # libinput-gestures
    xdotool
    pamixer
    qalculate-gtk
    obs-studio

    # tools
    wget
    neofetch
    flameshot
    git
    htop
    yadm
    killall
    gnome3.gnome-keyring
    qtkeychain
    playerctl
    wirelesstools
    bluez
    plasma-browser-integration
    exa
    bat
    xorg.xev
    # bluetoothctl

    # langs
    # ruby

  ];

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };


  # Some programs need SUID wrappers, can be configured further or are
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = (import ~/nixOS/users/dani/src/aliases.nix);


    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" ];
      theme = "nicoulaj"; # add a new line for the theme
    };
    initExtraBeforeCompInit = ''
      ${builtins.readFile ~/nixOS/users/dani/src/functions.nix}
      bindkey -M vicmd "^V" edit-command-line
    '';
 

 
  };


 
}
