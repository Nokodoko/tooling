#Make an init and shutdown function
function awsinit(){
    sed -i 's-#aws.zsh-source ~/.zsh/tooling/aws.zsh-' ~/.zshenv
    source ~/.zshenv
}
function awsoff(){
    sed -i 's-source ~/.zsh/tooling/aws.zsh-#aws.zsh-' ~/.zshenv
    source ~/.zshenv
}
