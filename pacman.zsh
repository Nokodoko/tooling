#------PACMAN------#
alias add='sudo pacman -S'
alias build='pacman -U'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias build='sudo pacman -U'
alias orphan='sudo pacman -Qtdq | pacman -Rns -'
alias search='sudo pacman -Q'

#-------YAY-------#
alias yupdate='sudo yay -Syu'
alias yadd='yay -S'
alias yremove='yay -Rns'


#------FUNCTIONS------#
function rollback(){sudo pacman -U $1}
function rev(){
    c /var/cache/pacman/pkg/ 
}
