#---ACITONS---#
alias zel='zellij'
alias zl='zellij ls'
alias zka='zellij kill-all-sessions -y'

zks(){
    zellij kill-session $1
}

za(){
    zellij attach $(zl | flisty 'Zellij Sessions')
}


#---LAYOUTS---#
alias z1='zellij --layout=/home/n0ko/.config/zellij/layouts/lay1.kdl'
alias z3='zellij --layout=/home/n0ko/.config/zellij/layouts/lay3.kdl'
alias zb='zellij --layout=/home/n0ko/.config/zellij/layouts/lay2.kdl'
