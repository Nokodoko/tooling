alias k='kubectl'
alias kx='kubectx'
alias kstage='kubectx staging'
alias kserv='kubectx services'
alias kprod='kubectx prod-jubilee'
alias kgs='kubectl get service -A -o wide'
alias kgp='kubectl get pods -A -o wide'
alias kns='kubens'
alias kge='kubectl get events'
alias ingLog='~/scripts/ingressLogs.sh'

#KREW
alias kks='kubectl krew search | fzf --reverse'

function kk() {
    kubectl krew $@
}

function kki() {
    kubectl krew install $(kubectl krew search | fzf --reverse | awk '{print $1}')  
}
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

function kjd() {
    k delete job -n $(k get jobs -A | fzf | awk '{print $1, $2}')
}

function kconf(){
    kubeconform -kubernetes-version $1
}

