#------GO------#
function gs(){
    du -a | rg $1(^"test.go") | fzf | xargs -r $EDITOR
}

function go_test() {
  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}

alias got='go_test -v'
alias clib='apropos -r '^std'|nvim -'
alias lib='cd /usr/lib/go/src && ls'
alias gt='gotest -v'
alias gtv='gotest'
function g1(){
  go run $1 | column
}
alias doc='go doc' 
alias gm='go run main.go'
alias gg='go get -u'
alias gb='go build'
alias gf='go fmt'
alias gl='go list -m all'
alias gmt='go mod tidy'
alias gmv='go mod vendor'
alias rs='cd ~/go/resources'

#------FUNCTIONS------#
function pro(){
    protoc -I ${PWD} --go_out=. $1
}

function gmi(){
    go mod init github/Nokodoko/$1
}
