#------Aliases------#
source /usr/share/fzf/completion.zsh
alias dell='n0ko@Dell'
#alias ip='iptables'
alias s='scp'
alias sr='scp -r'
alias n='nmap'
alias w='which'
alias ac='arp -a'
alias ipe='ip netns exec'
alias as='arp-scan --localnet'
alias gscan='sudo goscan'
alias s!='sudo !!'
alias gr='geo-recon.py'
alias lt='litecli'
alias kc='killall chromium'
alias pup='pup -c'
alias cal='calcurse'
alias top='bptop'
alias sl='c ~/n0koSuckless/slstatus'
alias vbox='virtualbox'
alias vr='virsh'
alias y='ytfzf -t'
alias pm='pulsemixer'
alias count='wc -l'
alias py='python'
alias kus='kustomize'
alias bugs='c ~/Videos/bugswriter/'
alias -s {html,go,css}=nvim
alias see='kitty icat'
alias cat='bat'
alias ccat='/bin/cat'
alias ddwm='cd ~/Programs/dwm/ && gs'
alias vb='nvim ~/.zshenv'
alias e='exit'
alias drc='nvim ~/.config/dunst/dunstrc'
alias v='nvim'
alias clock='tty-clock -cs -C 4'
alias god='sudo'
alias lx='v ~/.config/lynx/lynx.cfg'
alias lj='v ~/.config/lynx/jumpsUnix.html'
alias ly='lynx -cfg=/home/n0ko/.config/lynx/lynx.cfg'
alias Q='cd ..'
alias cls='clear ; sb'
alias neo='neofetch'
alias hg='kitty +kitten hyperlinked_grep'
alias md='mkdir'
alias ex='export'
alias evil='airmon-ng start wlp5s0mon'
alias evilt='airmon-ng --test wlp5s0mon'
alias ns='notify-send'
alias uzip='tar -xvf'
alias btar='bsdtar -xpf'
#alias zip='tar -xf'
#alias fc='fc-cache -f -v'
alias fig='figlet'
alias mk='mkdir'
alias s='surfraw'
alias ar='arandr'
alias yv='youtube-viewer'
alias mail='neomutt'
alias mp='mplayer'
alias doc='c ~/Documents'
alias md='mkdir'
alias s='surfraw'
alias n0='c ~/n0koSuckless/n0koBuild/'
alias dm='c ~/n0koSuckless/dmenu'
alias test='while sleep 2; do ping archlinux.org; done'
alias gp='rg'
alias repo='c ~/capacity/repos/'
alias um='sudo umount -R /mnt'
alias cmnt='c /mnt/'
alias socket='zmodload zsh/net/tcp'
alias ai='sgpt'
alias k='kubectl'
alias pb='~/.config/polybar/colorblocks/launch.sh'
alias poly='polybar'

alias gback='sudo downgrade glib2=2.74.6'

alias vpn='openvpn3 session-start --background --config ~/.pass/client.ovpn'
alias vpns='openvpn3 sessions-list'


#-----BUILD TOOLS-----#
alias makeit='makepkg -si'
alias smci='sudo make clean install -j5'

#------FUNCTION------#
function c(){
    cd $1 
    nvim $(lister.sh)
    #colorls --git-status
}

function cl(){
    cd $1 
    colorls --git-status
}

function mkc(){
    mkdir -p $1
    cd $1
}

function move(){
    back $@ &
    disown back
} 

function nsx(){
    nsxiv $@ &
    disown nsxiv
} 
function man() {
  /usr/bin/man $* | \
    col -b | \
    nvim -R -c 'set ft=man nomod nolist' -
}

    #man $(command man -k .  | gum filter | awk '{print $1, $2}')

function mkn(){
    mknod /dev/$1 $2 $3 $4
    cd $1
}

function sb(){
    cat ~/.zshenv > ~/.zsh/tooling/zshenv
    source ~/.zshenv
}

function mnt() {
    sudo mount $@ /mnt

}
function wallpaper() {
    feh --bg-scale $1
}

function vf() {
    v $(flist $( basename $( pwd )))
}

function vfd() {
    v $(fd -tf $1)
}

function cfd() {
    c $(fd -td $1)
}

function ldf(){
    c $1
    colorls --git-status
}
