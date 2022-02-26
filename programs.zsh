#------Programs------#
alias mu='mupdf'
alias mail='neomutt'
alias mp='mplayer'

#------FUNCTIONS------#
function m(){
    mpv $1 & disown mpv 
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
alias yt='ytfzf'

#------UDEMY-DL------#
function ud(){
    ~/Programs/udemy-dl/bin/udemy-dl-linux $1
}

function ud2(){
    python ~/Programs/udemy-dl/udemy-dl.py $1 -k ~/Programs/udemy-dl/cookie2.txt
}
