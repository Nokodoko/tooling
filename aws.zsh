#aws-completion
export PATH=/usr/sbin/aws_completer:$PATH

#authentication
alias awws='aws-mfa --device arn:aws:iam::632808888887:mfa/chris.montgomery --duration 86400'
alias paws='aws-mfa --device arn:aws:iam::591885507682:mfa/cMonty614 --profile cMonty614 --duration 86400'

#reset user-password
function resetpass() {
    aws update-login-profile --user-name $1 --password $(genPass)
}

#check caller
alias awsid='aws sts get-caller-identity'

#list ec2 instances (per profile)
alias lsec2c='awsc ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"'
alias lsec2='aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"'

#list ami-IDs (unfinished!!)
function lsami() {
    aws$1 ec2 describe-instances | gp -i imageid | cut -d: -f2| sed 's/"//g' | sed 's/,//'
}

#launch ec2
function launch() {
    aws ec2 run-instances --image-id $1 --count 1 --instance-type t2.micro --key-name $2 --security-group-ids $3 --subnet-id $4
}
#aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e

#aws-cli commands with alternate profile
function awsc(){
    aws $@ --profile cMonty614
}

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/sbin/aws_completer' aws
