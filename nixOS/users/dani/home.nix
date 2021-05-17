{ config, pkgs, ... }:
let 
  zsh-syntax-highlighting = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
    sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
  };

  powerlevel10k = pkgs.fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
    sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
  };


  unstable = import <nixos-unstable> {};
in

{
  programs.home-manager.enable = true;

  home.username = "dani";
  home.homeDirectory = "/home/dani";
  home.stateVersion = "21.03";

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
  home.packages = with pkgs; [
    #browser
    # firefox
    brave

    # editors
    vim
    # neovim
    vscode

    # terminal
    kitty
    st
    alacritty

    # WM
    sxhkd
    nitrogen
   #  polybar
    (polybar.override { pulseSupport = true; })
    rofi
    dunst
    notify-desktop

    # other
    discord
    betterdiscord-installer
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

    # media
    vlc

    # theming 
    lxappearance
    qt5ct

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
    xorg.xbacklight
    # alsamixer
    # light
    # bluetoothctl

    # langs
    # ruby

  ];


  programs.firefox = {
    enable = true;

    profiles = {
      myprofile = {
        userChrome = ''${builtins.readFile  ~/nixOS/users/dani/config/userchrome.nix}'';

        settings = {
          "general.smoothScroll" = true;
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
      { name = "zsh-syntax-highlighting"; src = zsh-syntax-highlighting; }
      { name = "powerlevel10k"; src = powerlevel10k; }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" ];
      # theme = "nicoulaj"; 
    };

    initExtraBeforeCompInit = ''
      ${builtins.readFile ~/nixOS/users/dani/src/functions.nix}
      bindkey -M vicmd "^V" edit-command-line

      # p10k
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh 
    '';
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;

   plugins = with pkgs.vimPlugins; [
     one-nvim
     gruvbox-nvim
    ];

    extraConfig = ''
      set number relativenumber
      syntax enable
      set nowrap
      set mouse=a
      set tabstop=2
      set expandtab 

    '';
  };
 
}
