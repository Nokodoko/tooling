#Capacity
alias repo='c ~/capacity/repos/'
alias dev='c ~/capacity/repos/dev/'
alias ops='c ~/capacity/repos/dev/ops/'
alias serv='c ~/capacity/repos/dev/services'
#alias apps='c ~/capacity/repos/dev/services/apps/'
function apps() {
    v ~/capacity/repos/dev/services/apps/$(cd ~/capacity/repo/dev/services/apps/ && exa | fzf)
}
alias bi='c ~/capacity/repos/dev/services/bi/'
alias ai='c ~/capacity/repos/dev/services/ai/'
alias rangers='c ~/capacity/repos/dev/services/dataRangers/'

