alias hh='cat ~/.zsh/tooling/helm.zsh'
alias h='helm'
alias hsh='helm search hub'
alias hsr='helm search repo'
alias hr='helm repo'
function hadd() {
    helm repo add $1 $2
}

function hu() {
    helm uninstall $(helm ls | awk '{print $1, $2}' |fzf)
}

function hhist () {
    helm history $(cat ~/helmInfo/helmSpeed.md | awk {'print $1'} | fzf)
}

function hget () {
    helm get $(cat ~/helmInfo/helmSpeed.md | awk {'print $1'} | fzf)
}

function hstatus () {
    helm status $(cat ~/helmInfo/helmSpeed.md | awk {'print $1'} | fzf)
}

function hls() {
    cat ~/helmInfo/helmSpeed.md
}

#function hup() {
#    helm upgrade --install  
#}
