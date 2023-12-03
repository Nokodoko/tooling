export TF_VAR_avail_zone="us-east-1a"

alias tf='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform'
alias tfi='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform init'
alias tfir='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform init -reconfigure'
alias tfs='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform state'
alias tfp='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan'
alias tfa='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply'
alias tfaa='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -auto-approve'
alias tfd='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy'
#alias tfsl='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform state list'
alias tfsl='terraform state list'

function tfpv() {
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -lock=false -var-file $1 
} 

function tfpt() {
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -target=$1
} 

function tfat(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -auto-approve -target=$1
} 

#function tfat(){
#    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply $1 -auto-approve -target=$1
#} 

function tfdt(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy -auto-approve -target=$1
} 
