# clean xev  
function xev() {
   $HOME/.nix-profile/bin/xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# git sync
gsync () {
    command="$@"
    git add *
    git commit -m "$command"
    git pull
    git push
    notify-desktop "GIT" "git synced"
} 

# dotfile sync
.sync () {
    command="$@"
    yadm add -u
    yadm commit -m "$command"
    yadm pull
    yadm push
    notify-desktop "GIT" "git synced"
}

#my top 10 used commands
top10 () {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD) print CMD[a] ) " " CMD[a]/count*100 "% " a;}' | \grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

#alt for man page
cheat () {
    curl cheat.sh/$1
}


# execute
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



countdown() {
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

stopwatch(){
    date1=`date +%s`; 
    while true; do 
    days=$(( $(($(date +%s) - date1)) / 86400 ))
    echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
    done
}
