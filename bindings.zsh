### Define the leader key
#leader="^["
##
### Bind the leader key to a widget
#zle -N zsh_leader
#bindkey "$leader" zsh_leader
##
##In this example, `^,` is the key sequence for the comma key. The `zle -N my-widget` command creates a new widget named `my-widget`, and the `bindkey "$leader" my-widget` command binds the leader key to this widget.
##
##Now, you can define the `my-widget` function to do whatever you want when the leader key is pressed. For example, you can bind the leader key followed by `n` to clear the screen:
##
##```zsh
### Define the zsh_leader function
#function zsh_leader() {
#  read -k1 -s key
#  case $key in
#    c)
#        config () {
#          pushd ~/.config
#          nvim $(fd -tf | fzf --layout reverse --border --border-label='Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
#      ;;
#    z)
#      zconf
#      ;;
#  *)
#      echo "Invalid Option"
#      ;;
#  esac
#}
##
### Bind the clear-screen widget to the leader key followed by n
##zle -N clear-screen
##bindkey "$leader n" clear-screen
