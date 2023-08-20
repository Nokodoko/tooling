#------GIT------#
alias lg="lazygit"
alias gref='git reflog'
alias gshow='git show'
alias gtag='git tag'
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gc='git clone'
alias gsv='git status -vvv'
alias gI='gitInit'
alias gi='gitinit'
alias gcom='git commit -m'
alias gcomx='git commit -am'
#alias gd='git difftool'
alias gdiff='git diff'
alias gdh='git difftool HEAD'
alias gs='git status'
alias gstatf='git status | fzf'
alias gadd='git add'
alias ga='git add --all'
alias gl='git log'
#alias gpush='git push --set-upstream origin'
alias gcout='git checkout'
alias gcheck='git checkout -b'
alias gbranch='git branch'
alias gd='git branch -D $(git branch)'
alias gd='git branch -D'
alias iv='sxiv' 
alias reset='make clean && rm -f config.h && git reset --hard origin/master'
alias progRefresh='~/scripts/progRefresh.sh'

alias g='gh'

#------FUNCTIONS------#
function flisty() {
    ARG=$@ 
    fzf --reverse --border --border-label="$ARG"
}
function gdel() {
    git branch -D $(git branch | $(flisty "Delete Branch"))
}

function gremote(){
    git remote add origin git@github.com:Nokodoko/$1.git
}

function gpush() {
    git push --set-upstream origin $1
}

function gco() {
    git checkout -b $1
}
function gcco() {
    git checkout $(git branch -al | flisty 'GIT CHECKOUT')
}


function gcct() {
    git checkout $(git tag -l | flisty "Git Tags")
}

function grcp() {
    gh repo create $1 --public --clone
}

function grcP() {
    gh repo create $1 --private --clone
}
