alias d='dunstctl'
alias dhp='dunstctl history-pop'
function dtest() {
    pidof dunst && killall dunst
    dunst &
}

