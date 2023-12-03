alias a='ansible'
alias ap='ansible-playbook'
alias ua='ansible-playbook ~/playbooks/update.yml'

function aa() {
    ansible machines:all -b -m community.general.pacman -a "name=$1"
}

function al() {
    ansible laptops:all -m community.general.pacman -a "name=$1"
}

function apis() {
    ansible pi:all -m community.general.pacman -a "name=$1"
}

function add-target() {
    ansible "$1" -b -m community.general.pacman -a "name=$2"
}
