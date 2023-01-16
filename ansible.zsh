alias a='ansible'
alias ap='ansible-playbook'
alias update-all='ansible-playbook ~/playbooks/update.yml'

function add-all() {
    ansible machines:all -m community.general.pacman -a "name=$1"
}
