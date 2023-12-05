#------OPTIONS TO FZF COMMAND------#
source /usr/share/fzf/completion.zsh
export FZF_COMPLETION_OPTS='+c -x'
export FZF_COMPLETION_TRIGGER='**'
export FZF_OPEN_COMMAND=''
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --threads=15 --type f'

function lsf(){
    fzf | xargs mplayer
}

function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

#------USE FD TO GENERATE THE LIST FOR DIRECTORY COMPLETION------#
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

function _fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    $ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

function f() {
    fzf --layout reverse --preview 'bat --style=numbers --color=always --line-range :500 {}'
}
