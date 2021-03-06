export TF_VAR_avail_zone="us-east-1a"

alias tf='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform'
alias tfi='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform init'
alias tfir='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform init -reconfigure'
alias tfs='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform state'
alias tfp='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan'
alias tfa='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply'
alias tfaa='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -auto-approve'
alias tfd='TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy'

function tfpv() {
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -lock=false -var-file $1 
} 

function tfav(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -lock=false -var-file $1 -auto-approve
} 

function tfdv(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy -lock=false -var-file $1 -auto-approve
} 

alias tfpt(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -target=$1
}

alias tfat(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -target=$1
}

alias tfaat(){
    TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -auto-approve -target=$1
}
