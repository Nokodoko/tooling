alias kx='kubectx'
alias kstage='kubectx staging'
alias kstagef='kubectx staging-fuji'
alias kserv='kubectx services'
alias kprod='kubectx production'
alias kgn='kubectl get nodes -o wide'
alias kgs='kubectl get service -o wide'
alias kds='kubectl describe service -o wide'
alias kgp='kubectl get pods -o wide'
alias kns='kubens'
function kpf() {
    kubectl port-forward $1 $2
}
