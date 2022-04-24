alias d='dunstctl'
alias dhp='dunstctl history-pop'
alias dfy='dunstify'
alias dprint='dunst --print'
function dtest() {
    pidof dunst && killall dunst
    dunst &
    dfy -u low "hi"
}

