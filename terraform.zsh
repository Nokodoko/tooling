export TF_VAR_avail_zone="us-east-1a"

alias tf='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform'
alias tfi='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform init'
alias tfs='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform state'

function tfp() {
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -lock=false -var-file $1 
} 

function tfa(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -lock=false -var-file $1 -auto-approve
} 

function tfd(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy -lock=false -var-file $1 -auto-approve
} 
