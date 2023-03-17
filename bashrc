# --- exports ---
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# fzf config
export FZF_DEFAULT_OPTS='--bind ctrl-u:half-page-up --bind ctrl-d:half-page-down'

# --- alias ---
# GNU screen
alias sr="screen -xRR"
alias sl="screen -ls"

# rm
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# ls
alias ls="ls -lh --color"

# ipython with vi mode
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"

# load z.sh script
. ~/.z.sh

