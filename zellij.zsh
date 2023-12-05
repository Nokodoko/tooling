#---ACITONS---#
alias zel='zellij'
alias zl='zellij ls'
alias zka='zellij kill-all-sessions -y'

zks(){
    zellij kill-session $1
}

za(){
    zellij attach $(zellij list-sessions | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $1}'| flisty 'Zellij Sessions')
}

zd(){
    zellij delete $(zellij list-sessions | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $1}'| flisty 'Zellij Sessions')
}

#---LAYOUTS---#
alias z1='zellij --layout=/home/n0ko/.config/zellij/layouts/lay1.kdl'
alias z3='zellij --layout=/home/n0ko/.config/zellij/layouts/lay3.kdl'
alias zb='zellij --layout=/home/n0ko/.config/zellij/layouts/lay2.kdl'
