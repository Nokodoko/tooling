# vim:foldmethod=marker
#------SYSTEMD------#
alias stop='sudo systemctl stop'
alias auto='sudo systemctl enable'
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl daemon-reload'
alias sys='sudo systemctl'
alias status='systemctl status'

#-----LOGGING-----#
ALIAS JOURNAL='JOURNALCTL -XE'
ALIAS VAC='JOURNALCTL --VACUUM-TIME=5D'

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

#-----NETWORKING-----#
ALIAS WIOFF='SUDO IP LINK SET WLAN0 DOWN'
ALIAS WION='SUDO IP LINK SET WLAN0 UP'
ALIAS ETHOFF='SUDO SYSTEMCTL STOP DHCPCD'
ALIAS ETHON='SUDO SYSTEMCTL START DHCPCD '
ALIAS NETCTLOFF='SUDO SYSTEMCTL STOP NETCTL'
ALIAS NETCTLON='SUDO SYSTEMCTL START NETCTL'
ALIAS ETH='SUDO SYSTEMCTL START DHCPCD'
ALIAS ETHO='SUDO SYSTEMCTL STOP DHCPCD'

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
