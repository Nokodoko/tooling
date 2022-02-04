#------SYSTEMD------#
alias order66='sudo systemctl stop'
alias dewit='sudo systemctl enable'
alias dewitnow='sudo systemctl start'
alias journal='journalctl -xe'
alias reload='sudo systemctl daemon-reload'
alias wiservoff='sudo ip link set wlp0s20f3 down'
alias wiservon='sudo systemctl start netctl'
alias eth='sudo systemctl start dhcpcd'
alias etho='sudo systemctl stop dhcpcd'
alias sys='systemctl'
alias sys_s='systemctl status'
alias sys_start='systemctl start'

#------NETCTL------#
alias wifi='sudo netctl start'
alias dad='sudo netctl start Dad'
alias byedad='sudo netctl stop Dad'
alias here='sudo netctl start wlp0s20f3-n0koSpeed'
alias here2='sudo netctl start homie'
alias nothere='sudo netctl stop wlp0s20f3-n0koSpeed'
alias nothere2='sudo netctl stop homie'
alias there='sudo netctl start mobileC'
alias northere='sudo netctl stop mobileC'
alias why='sudo wifi-menu'
alias air='aircrack-ng'
alias blue='bluetoothctl'

#------FUNCTIONS------#
function syst(){
    systemctl list-unit-files --type=target
}

alias vag='vagrant'

function vagb(){
    vagrant box add $1
}

function sysl(){
    sudo systemctl list-dependencies multi-user.target
}

function sys_r(){
    sudo systemctl reload $1 
}
