alias hh='cat ~/.zsh/tooling/helm.zsh'
alias h='helm'
alias hsh='helm search hub'
alias hsr='helm search repo'
alias hr='helm repo'
function hadd() {
    helm repo add $1 $2
}
