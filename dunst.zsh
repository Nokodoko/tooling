alias d='dunstctl'
alias dhp='dunstctl history-pop'
function drestart() {
    pidof dunst && killall dunst
    dunst &
}

