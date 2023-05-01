alias hh='cat ~/.zsh/tooling/helm.zsh'
alias h='helm'
alias hsh='helm search hub'
alias hsr='helm search repo'
alias hr='helm repo'
function hadd() {
    helm repo add $1 $2
}

function hu() {
    helm uninstall $(helm ls | awk '{print $1, $2}' |fzf --layout reverse)
}

function hhist () {
    helm history -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}

function hget () {
    helm get -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}

function hstat() {
    helm status -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}

function hstats() {
    helm status -n $(cat ~/helmInfo/servSpeed.md | awk {'print $2, $1'} | fzf --layout reverse)
}

function hls() {
    cat ~/helmInfo/helmSpeed.md
}

function hlss() {
    cat ~/helmInfo/servSpeed.md
}

function hup() {
    helm secrets upgrade --install --namespace $(cat ~/helmInfo/helmUpdate.md | fzf --layout reverse | awk '{print $2, $1}') . -f $@
}


function hups() {
    helm secrets upgrade --install --namespace $(cat ~/helmInfo/servSpeed.md | fzf --layout reverse | awk '{print $2, $1}') . -f $@
}

function htemp(){
    helm template $(hls | awk '{print $1}' | fzf --layout reverse)
}

