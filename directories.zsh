#------DIRECTORIES------#
function flist() {
    ARG=$@
    fzf --layout reverse --border --border-label="$ARG" --preview 'bat --style=numbers --color=always --line-range :500 {}'
}
alias exe='c /usr/local/bin'
alias down='c ~/Downloads'
alias resume='c ~/Downloads/resumes'
#alias prog='c ~/Programs'
function prog(){
    pushd ~/Programs 
    cd  $(fd -td -d1 | fzf --layout reverse --border --border-label='Programs' --preview 'bat --style=numbers --color=always --line-range :500 {}')

}


alias port='c ~/Portfolio'
alias vid='c ~/Videos'
alias pic='c ~/Pictures'
alias udemy='c ~/Videos/Udemy'
alias mit='c ~/MIT'
alias music='c ~/music'
alias ws='wiki-search'
alias manual='c ~/manuals/'
alias mirrors='sudo v /etc/pacman.d/mirrorlist'
alias tool='cl ~/.zsh/tooling/'
alias exp='c ~/.zsh/exports/'
alias qk='c ~/Programs/qmk_firmware'

#arch
alias arch='c /usr/share/doc/arch-wiki/html/en/'
#alias spell='c ~/scripts'

function spell() {
    pushd ~/scripts && vf
    #v ~/scripts/$(c ~/scripts/ | awk '{print $3}' | f)
}

#dunst
alias dmagic='c ~/scripts/dunstMagic/'

#credentials
alias aconf='v ~/.aws/credentials'

#fonts
alias fonts='c /usr/share/fonts/'
alias lsp='c /home/n0ko/.local/share/nvim/lsp_servers/'
alias lspconfig='c /home/n0ko/.local/share/nvim/site/pack/packer/start/nvim-lspconfig/lua/lspconfig/server_configurations'

#nvim directories
function plug (){
    pushd ~/.local/share/nvim/site/pack/packer/start/ && \
        c $(fd -td -d1 |fzf --layout reverse --border --border-label='Neovim Plugins' --preview 'bat --style=numbers --color=always --line-range :500 {}') 
}
alias plugin='cl ~/.local/share/nvim/site/pack/packer/start/'
alias sv='sudo nvim'
alias swapped='rm ~/.local/share/nvim/swap//%home%n0ko%.config%nvim%init.vim.swp'
alias swap='rm ~/.local/share/nvim/swap//%home%n0ko%.zsh.swp'
alias playbook='c ~/playbooks/'

#hosts
alias hosts='sudo nvim /etc/hosts'
#golang
alias alg='c ~/algorithmswithgo.com/module01 &&'
alias play='c ~/goPlay'
alias gtrain='c ~/gotraining'
alias gosrc='c ~/go/src'
alias goclass='c ~/Videos/Udemy/Go/learn-how-to-code/'
alias pprof='go tool pprof'
alias gu='c ~/goUltimate v main.go'
alias hack='c ~/programming/hack/'
alias api='c ~/programming/apiClass/'

#configs
function zconf() {
    v ~/.zsh/tooling/$(cd ~/.zsh/tooling && exa | fzf --layout reverse --border --border-label='Zsh Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
function vconf() {
    pushd ~/.config/nvim
    v $(fd -e lua . | flist "Neovim Configurations")
}
function exconf() {
    v ~/.zsh/exports/$(cd ~/.zsh/exports && exa | fzf --layout reverse --border --border-label='Export Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
function bs() {
    v ~/capacity/repos/scripts/bin/$(cd ~/capacity/repos/scripts/bin && exa | fzf --layout reverse --border --border-label='Capacity Scripts' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
function config() {
    pushd ~/.config
    v $(fd -tf | fzf --layout reverse --border --border-label='Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}

#alias vconf='c ~/.config/nvim/lua/n0ko/'
alias vv='v ~/.config/nvim/init.lua'
alias mconf='v ~/.config/neomutt/neomuttrc'
alias conf='c ~/.config'
alias vimrc='v ~/.config/nvim/init.vim'
alias n0='c ~/n0koSuckless/n0koBuild/'
alias sl='c ~/n0koSuckless/slstatus/'
alias dm='c ~/n0koSuckless/dmenu-5.1/'
alias sl='c ~/n0koSuckless/slstatus'
alias km='v ~/.config/kmonad/config.kbd'
alias ky='v ~/.config/kitty/kitty.conf'
