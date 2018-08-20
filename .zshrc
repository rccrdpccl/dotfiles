
if [[ -f $HOME/.zsh/antigen.zsh ]]; then
    source $HOME/.zsh/antigen.zsh
else
    printf "Installing antigen..."
    mkdir -p $HOME/.zsh/
    curl -sS -L git.io/antigen > $HOME/.zsh/antigen.zsh
    source $HOME/.zsh/antigen.zsh
    printf " done.\n"
fi

mkdir -p $HOME/bin/
export PATH="${PATH}:$HOME/bin:$HOME/.local/bin"

export TERM="xterm-256color"

antigen init .antigenrc

alias vpn='sudo openconnect -u riccardo.piccoli https://endpoint-bcn.softonic.com'

alias swarm-production='eval $(~/src/swarminate/swarm-mode/connections/docker-connect swarm-production ~/.ssh/swarm-cluster swarm-production 14586)'
alias swarm-staging='eval $(~/src/swarminate/swarm-mode/connections/docker-connect swarm-staging ~/.ssh/swarm-cluster swarm-staging 14587)'
alias swarm-ci='eval $(~/src/swarminate/swarm-mode/connections/docker-connect swarm-ci ~/.ssh/swarm-cluster swarm-ci 14588)'
alias swarm-clean='eval $(~/src/swarminate/swarm-mode/connections/docker-disconnect)'

export MINIKUBE_HOME=$HOME
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
mkdir -p $HOME/.kube
touch $HOME/.kube/config

export KUBECONFIG=$HOME/.kube/config

source <(kubectl completion zsh)

export EDITOR=emacs25-nox

function generate_password() {
    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
}

fpath=(~/.autocomplete $fpath) 
