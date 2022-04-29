alias d='dunstctl'
alias dhp='dunstctl history-pop'
alias dfy='dunstify'
alias dpause='dunstctl set-paused true'
alias dresume='dunstctl set-paused false'
alias dprint='dunst --print'
function dtest() {
    pidof dunst && killall dunst
    dunst &
    dfy -u low "hi"
}

