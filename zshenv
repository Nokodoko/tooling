#& refresh.sh------ZSHRC------#
autoload -Uz compinit && compinit -i
compinit -D
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
[[ $- != *i* ]] && return
fpath=(~/.zsh/completion $fpath)
set -o vi
set -o ignoreeof

#pfetch | lolcat

#bunnyfetch | lolcat
#export PF_COL1=4
#export P4_COL2=5
#export PF_COL3=5
#cowsay -f bunny "n0ko"

#------SOURCING------#
#source ~/Programs/kube-ps1/kube-ps1.sh
source ~/.zsh/tooling/aliases.zsh
source ~/.zsh/tooling/aws.zsh
source ~/.zsh/tooling/c.zsh
source ~/.zsh/tooling/colorls.zsh
source ~/.zsh/tooling/directories.zsh
source ~/.zsh/tooling/docker.zsh
source ~/.zsh/exports/exports.zsh
source ~/.zsh/tooling/fzf.zsh
source ~/.zsh/tooling/git.zsh
source ~/.zsh/tooling/go.zsh
source ~/.zsh/tooling/jira.zsh
source ~/.zsh/tooling/ai.zsh
source ~/.zsh/tooling/lsp.zsh
#source ~/.zsh/tooling/npm.zsh
source ~/.zsh/tooling/pacman.zsh
source ~/.zsh/tooling/programs.zsh
source ~/.zsh/exports/ssh.zsh
source ~/.zsh/tooling/starship.zsh
source ~/.zsh/tooling/systemd.zsh
source ~/.zsh/tooling/terraform.zsh
source ~/.zsh/tooling/xserver.zsh
source ~/.zsh/tooling/init.zsh
source ~/.zsh/tooling/ansible.zsh
#source ~/.zsh/tooling/ip.zsh
source ~/.zsh/exports/capacity.zsh
source ~/.zsh/tooling/helm.zsh
#source ~/.zsh/tooling/tmux.zsh
source ~/.zsh/tooling/k8.zsh
source ~/.zsh/tooling/bindings.zsh
source ~/.zsh/tooling/dunst.zsh
source ~/.zsh/tooling/keyboards.zsh
source ~/.zsh/tooling/mount.zsh
source ~/.zsh/tooling/rust.zsh
#fzf
source ~/.fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Programs/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

alias path='echo -e ${PATH//:/\\n}'
alias evil='airmon-ng start wlan0'
alias evilt='airmon-ng --test wlan0'
alias ns='notify-send'
alias nsc='notify-send -u critical hello'

#Functions
function chx(){
    #sudo chmod +x $1 && sudo cp $1 /usr/local/bin/
    chmod +x $1 
}

function p(){
    kitty +kitten icat $@
}

function get-source() {
    asp export $1 && \
    pushd $1 && \
    makepkg -do --skippgpcheck && \
    pushd src
}

bindkey '^ ' forward-word
#. /opt/asdf-vm/asdf.sh
. "$HOME/.cargo/env"
