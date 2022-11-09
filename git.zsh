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
alias gs='colorls --git-status'
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



function capRefresh() {
for dir in */; do
    cd "$dir"
	git pull
	cd ..
done
}
#------FUNCTIONS------#
#function gbranch() {
#    git checkout $(git branch | fzf)
#}

function gdel() {
    git branch -d $(git branch | fzf)
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
    git checkout $1
}
