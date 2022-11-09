#------SYSTEMD------#
alias order66='sudo systemctl stop'
alias dewit='sudo systemctl enable'
alias dewitnow='sudo systemctl start'
alias journal='journalctl -xe'
alias reload='sudo systemctl daemon-reload'
alias wiservoff='sudo ip link set wlan0 down'
#alias wiservon='sudo ip link set wlan0 up'
alias wiservon='sudo systemctl start netctl'
alias eth='sudo systemctl start dhcpcd'
alias etho='sudo systemctl stop dhcpcd'
alias sys='sudo systemctl'
alias sys_s='systemctl status'
alias sys_start='systemctl start'

#------NETCTL------#
alias wifi='sudo netctl start'
alias dad='sudo netctl start Dad'
alias byedad='sudo netctl stop Dad'
alias here='sudo netctl start wlan0-n0koSpeed'
alias nothere='sudo netctl stop wlan0-n0koSpeed'
alias nothere='sudo netctl start wlan0-n0koMove'
alias nothere='sudo netctl stop wlan0-n0koMove'
alias there='sudo netctl start wlan0-Verizon-Mifi8800L-43B4'
alias northere='sudo netctl stop Verizon-Mifi8800L-43B4'
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

function j() {
    journalctl -xe | rg -i $@
}
