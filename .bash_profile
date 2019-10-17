# bash prompt
export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\W \\$\[$(tput sgr0)\] "

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Bash completion
. /usr/local/etc/bash_completion
. ~/git-completion.bash

# Misc aliases
alias chrome='open -a "Google Chrome"'

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/go

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# startup
alias startup='sudo pfctl -d ; sudo pfctl -e -f /etc/pf.conf'

# fast dir cd
alias tcom-serp='cd ~/Projects/tcom-serp'

# DCOM dev
export PATH=$PATH:~/Projects/dev

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

