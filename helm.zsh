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

function hstat() {
    helm status $(cat ~/helmInfo/helmSpeed.md | awk {'print $1'} | fzf)
}

function hstats() {
    helm status $(cat ~/helmInfo/servSpeed.md | awk {'print $1'} | fzf)
}

function hls() {
    cat ~/helmInfo/helmSpeed.md
}

function hlss() {
    cat ~/helmInfo/servSpeed.md
}

function hup() {
    helm secrets upgrade --install --namespace $(cat ~/helmInfo/helmUpdate.md | fzf | awk '{print $2, $1}') . -f $@
}


function hups() {
    helm secrets upgrade --install --namespace $(cat ~/helmInfo/servSpeed.md | fzf | awk '{print $2, $1}') . -f $@
}
