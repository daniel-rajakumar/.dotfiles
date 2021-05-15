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
    notify-send "GIT" "git synced"
}

