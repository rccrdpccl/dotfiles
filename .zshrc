
if [[ -f $HOME/.zsh/antigen.zsh ]]; then
    source $HOME/.zsh/antigen.zsh
else
    printf "Installing antigen..."
    mkdir -p $HOME/.zsh/
    curl -sS -L git.io/antigen > $HOME/.zsh/antigen.zsh
    source $HOME/.zsh/antigen.zsh
    printf " done.\n"
fi

export TERM="xterm-256color"

antigen init .antigenrc
