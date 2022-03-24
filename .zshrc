ZSH_THEME="robbyrussell"

plugins=(git vi-mode z)

source $ZSH/oh-my-zsh.sh

alias ls="ls -lh --color"

# load z.sh script
. ~/.z.sh

# ipython with vi mode
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"

# GNU screen
alias sr="screen -xRR"
alias ss="screen -S"
alias sl="screen -ls"

# fzf config
export FZF_DEFAULT_OPTS='--bind ctrl-u:half-page-up --bind ctrl-d:half-page-down'
