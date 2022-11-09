alias k='kubectl'
alias kx='kubectx'
alias kstage='kubectx staging'
alias kstagef='kubectx staging-fuji'
alias kserv='kubectx services'
alias kprod='kubectx prod-jubilee'
alias kgn='kubectl get nodes -o wide'
alias kgs='kubectl get service -A -o wide'
alias kgp='kubectl get pods -A -o wide'
alias kns='kubens'
alias kge='kubectl get events'
alias kdn='~/scripts/kdn.sh'
alias kdp='~/scripts/kdp.sh'
alias kdd='~/scripts/kdd.sh'
alias kds='~/scripts/kds.sh'
alias kdc='~/scripts/kdc.sh'
alias kdj='~/scripts/kdj.sh'
alias kep='~/scripts/kep.sh'
alias ked='~/scripts/ked.sh'
alias ken='~/scripts/ken.sh'
alias kej='~/scripts/kej.sh'
alias klp='~/scripts/klp.sh'
alias klp='~/scripts/klp.sh'
alias kli='~/scripts/kli.sh'
alias ingLog='~/scripts/ingressLogs.sh'
alias kexec='~/scripts/kexec.sh'

#FUNCTION
function kpf() {
    kubectl port-forward $1 $2
}

function kggp() {
    kubectl get pods -A | rg -i $1
}

function kggn() {
    kubectl get nodes | rg -i $1
}
function kgnl() {
    kubectl get nodes -l type=$1
}
function kggj() {
    kubectl get jobs -A -o wide | rg -i $1
}

