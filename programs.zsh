#------Programs------#
alias mu='mupdf'
alias mail='neomutt'
alias mp='mplayer'
alias trace='traceroute'
alias q86='qemu-system-x86_64 -hda'
alias btop='btop --utf-force'
alias t='tmux'
alias clip='xclip -sel c'
#alias dmenu='dmenu -c -m 0 -fn VictorMono:size=11 -nf cyan -nb black -nf cyan -sb black'
alias gcu='google-chrome-unstable'
alias dfu='dfu-programmer'
alias list='cal -Q'
alias wee='weechat'

#------FUNCTIONS------#
function cookbook() {
    pushd ~/Programs/rust-cookbook/
    mdbook serve --open & disown
    sleep 1s
    ly localhost:3000
}

function m(){
    mpv $1 & disown mpv 
}

function mi(){
    mpv --vf=sub,lavfi="negate" $1 & disown mpv
}

function key(){
    screenkey $1 & disown screenkey 
}

function z(){
    zathura $1 &
    disown zathura
}

#------TERRAFORM------#
alias tra='terraform'


#------TSHARK------# 
alias shk='tshark' 

function shky() { tshark -Y $@ }

#------NMAP------#
function scan() {
n $1 scanme.nmap.org
}

function output() {
    nmap -oN $1 $2
}

function sweep() {
    nmap -sP -oG $1 $2
}

function os() {
    sudo n -O $1
}

#------YOUTUBE-DL------#
alias ytd='yt-dlp'
alias mus='yt-dlp -x'
#alias yt='ytfzf'

#------UDEMY-DL------#
function ud(){
    ~/Programs/udemy-dl/bin/udemy-dl-linux $1
}

function ud2(){
    python ~/Programs/udemy-dl/udemy-dl.py $1 -k ~/Programs/udemy-dl/cookie2.txt
}

##-----loop-----#
#function loop() {
#    while sleep 2; do $@; done
#}

