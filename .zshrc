if [[ -f $HOME/.zsh/antigen.zsh ]]; then
    source $HOME/.zsh/antigen.zsh
else
    printf "Installing antigen..."
    mkdir -p $HOME/.zsh/
    curl -sS -L git.io/antigen > $HOME/.zsh/antigen.zsh
    source $HOME/.zsh/antigen.zsh
    printf " done.\n"
fi
cd ~
antigen init .antigenrc
cd -

clear

command -v kubectl >/dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo apt-get update && sudo apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
fi

mkdir -p $HOME/bin/
export PATH="${PATH}:$HOME/bin:$HOME/.local/bin"

export TERM="xterm-256color"

export MINIKUBE_HOME=$HOME
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
mkdir -p $HOME/.kube
touch $HOME/.kube/config

export KUBECONFIG=$HOME/.kube/config

source <(kubectl completion zsh)

export EDITOR=emacs25

function generate_password() {
    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
}

fpath=(~/.autocomplete $fpath) 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/riccardo/google-cloud-sdk/path.zsh.inc' ]; then . '/home/riccardo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/riccardo/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/riccardo/google-cloud-sdk/completion.zsh.inc'; fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

alias kpush='file=$(tempfile) && cp $KUBECONFIG $file && export PUSHED_KUBECONFIG=$KUBECONFIG && export KUBECONFIG=$file'
alias kpop='export KUBECONFIG=$PUSHED_KUBECONFIG'
