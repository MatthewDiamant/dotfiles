# bash prompt
export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\W \\$\[$(tput sgr0)\] "

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Bash completion
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

# Screen reattach
alias sr='screen -r'

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

aws-sd(){
    AWS_PROFILE=sd
    AWS_ROLE=arn:aws:iam::281059476650:role/Developers
    #eks
}

aws-pa(){
    AWS_PROFILE=pa
    AWS_ROLE=arn:aws:iam::058511034767:role/DcomKubernetesAdmin
}

aws() {
    aws-vault exec $AWS_PROFILE -- /usr/local/bin/aws "$@"
}

kubectl() {
    aws-vault exec $AWS_PROFILE -- /usr/local/bin/kubectl "$@"
}

eks(){
    aws eks --region us-east-1 update-kubeconfig --name global
}

argo(){
    aws-vault exec $AWS_PROFILE -- /usr/local/bin/argo "$@"
}

dvc(){
    aws-vault exec $AWS_PROFILE -- /home/mmfield/default/bin/dvc "$@"
}

helm(){
    aws-vault exec $AWS_PROFILE -- /usr/local/bin/helm "$@"
}

kibana(){
    kubectl port-forward -n logging service/kibana-ui-kb-http 8081:5601
}

grafana(){
    POD_NAME=$(kubectl get pods --namespace monitoring -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}")
    kubectl --namespace monitoring port-forward $POD_NAME 3000
}


# staging by default
aws-sd
