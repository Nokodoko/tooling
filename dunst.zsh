alias d='dunstctl'
alias dhp='dunstctl history-pop'
alias dfy='dunstify'
function dtest() {
    pidof dunst && killall dunst
    dunst &
    ns hi
}

