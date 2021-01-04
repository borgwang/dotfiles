# --- Alias ---
# GNU screen
alias sr="screen -r"
alias ss="screen -S"
alias sl="screen -ls"

# git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m "
alias gps="git push origin master"
alias gpl="git pull"
alias gst="git stash"
alias gd="git diff"
alias gb="git branch --sort=-committerdate"
alias gbc="git checkout"
alias gbn="git branch -n"

# rm
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# User specific aliases and functions
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- Others ---
# load z.sh script (download z.sh from)
. ~/.z.sh
