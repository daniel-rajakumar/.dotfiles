{

  #MUST
  ":q"="exit";
  "vim"="nvim";
  cls="clear";
  md="mkdir -pv";
  clear="clear -x";
  cat="bat --theme=TwoDark";


  ll="exa -alh --icons --git --color=always --group-directories-first -s Extension";
  ls="exa -a --icons --git --color=always --group-directories-first -s Extension"; 
  tree="exa -aT --icons --git  --color=always --group-directories-first"; 

  grep="grep --color=auto";
  egrep="egrep --color=auto";
  fgrep="fgrep --color=auto";

  # other flags
  cp="cp -i";                          # confirm before overwriting something
  df="df -h";                          # human-readable sizes
  free="free -h";                      # human-readable sizes

  ## get top process eating memory
  psmem="ps auxf | sort -nr -k 4";
  psmem10="ps auxf | sort -nr -k 4 | head -10";


  #nixOS
  hsync = "home-manager switch -f $HOME/nixOS/users/dani/home.nix";
  ssync = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixOS/system/configuration.nix";

}
 

