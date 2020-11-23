# Oh My Zsh
export ZSH="/Users/mattdiamant/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/go

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Screen reattach
alias sr='screen -r'

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Huxley kubectl aws things
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
