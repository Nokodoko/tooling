#Capacity
alias repo='c ~/capacity/repos/'
alias dev='c ~/capacity/repos/dev/'
alias ops='c ~/capacity/repos/dev/ops/'
alias services='c ~/capacity/repos/dev/services'
basedir='~/capacity/repos/dev/'

function serv() {
    v $(cd ~/capacity/repos/dev/services && fzf)
}

function cf() {
    v $(fd -d9 -tf yaml ~/capacity/repos/dev/ | fzf)
}

function ops() {
    v $(fd -d5 -tf tf ~/capacity/repos/dev/ops | fzf)
}
#alias apps='c ~/capacity/repos/dev/services/apps/'
function apps() {
    v $(fd -tf yaml -d9 --full-path ~/capacity/repos/dev | fzf)
}
##
##function ops() {
##    v $(fd -tf yaml -d9 --full-path ~/capacity/repos/dev | fzf)
##}
##
##function serv() {
##    v $(fd -tf yaml -d9 --full-path ~/capacity/repos/dev | fzf)
##}
##
##function dev() {
##    v $(fd -tf yaml -d9 --full-path ~/capacity/repos/dev | fzf)
##}
alias bi='c ~/capacity/repos/dev/services/bi/'
alias ai='c ~/capacity/repos/dev/services/ai/'
alias rangers='c ~/capacity/repos/dev/services/dataRangers/'

