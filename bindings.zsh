#comSub(){
#    "\$()"
#}
#zle -N comSub
#bindkey '::' 'comSub'
#
# ```zsh
## Define the leader key
#leader="^,"
#
## Bind the leader key to a widget
#zle -N my-widget
#bindkey "$leader" my-widget
#```
#
#In this example, `^,` is the key sequence for the comma key. The `zle -N my-widget` command creates a new widget named `my-widget`, and the `bindkey "$leader" my-widget` command binds the leader key to this widget.
#
#Now, you can define the `my-widget` function to do whatever you want when the leader key is pressed. For example, you can bind the leader key followed by `n` to clear the screen:
#
#```zsh
## Define the my-widget function
#function my-widget() {
#  read -k1 -s key
#  case $key in
#    n)
#      clear-screen
#      ;;
#    # Add more key bindings here...
#  esac
#}
#
## Bind the clear-screen widget to the leader key followed by n
#zle -N clear-screen
#bindkey "$leader n" clear-screen
