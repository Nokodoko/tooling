# vim:foldmethod=marker
#------systemd------#
alias stop='sudo systemctl stop'
alias auto='sudo systemctl enable'
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl daemon-reload'
alias sys='sudo systemctl'
alias status='systemctl status'

#-----logging-----#
alias journal='journalctl -xe'
alias vac='sudo journalctl --vacuum-time=5d'

#------netctl------#
alias wifi='sudo netctl start'
alias dad='sudo netctl start dad'
alias byedad='sudo netctl stop dad'
alias here='sudo netctl start wlan0-n0kospeed'
alias nothere='sudo netctl stop wlan0-n0kospeed'
alias nothere='sudo netctl start wlan0-n0komove'
alias nothere='sudo netctl stop wlan0-n0komove'
alias there='sudo netctl start wlan0-verizon-mifi8800l-43b4'
alias northere='sudo netctl stop verizon-mifi8800l-43b4'
alias why='sudo wifi-menu'
alias air='aircrack-ng'
alias blue='bluetoothctl'

#-----networking-----#
alias wioff='sudo ip link set wlan0 down'
alias wion='sudo ip link set wlan0 up'
alias ethoff='sudo systemctl stop dhcpcd'
alias ethon='sudo systemctl start dhcpcd '
alias netctloff='sudo systemctl stop netctl'
alias netctlon='sudo systemctl start netctl'
alias eth='sudo systemctl start dhcpcd'
alias etho='sudo systemctl stop dhcpcd'

#------functions------#
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

function j() {
    journalctl -xe | rg -i $@
}
