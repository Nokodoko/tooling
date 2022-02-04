export TF_VAR_avail_zone="us-east-1a"

alias tf='terraform'
alias tfi='terraform init'
alias tfs='terraform state'

function tfp() {
    terraform plan -var-file $1 
} 

function tfa(){
    terraform apply -var-file $1 -auto-approve
} 

function tfd(){
    terraform destroy -var-file $1 -auto-approve
} 
