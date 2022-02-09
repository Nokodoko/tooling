#aws-completion
export PATH=/usr/sbin/aws_completer:$PATH

#authentication
alias awws='aws-mfa --device arn:aws:iam::632808888887:mfa/chris.montgomery --duration 86400'
alias paws='aws-mfa --device arn:aws:iam::591885507682:mfa/cMonty614 --profile cMonty614 --duration 86400'

#reset user-password
function resetpass() {
    genPass >> newpass.txt; 
    aws iam update-login-profile --user-name $1 --password $(cat newpass.txt);
    cat newpass.txt | pbcopy
    rm newpass.txt
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

#aws-cli commands with alternate profile
function awsc(){
    aws $@ --profile cMonty614
}

function insid() {
    lsec2 | gp -i i  | sed 's/"//g' | sed 's/,//' | gp c |sed -n ${1}p
}

function insidc() {
    lsec2c | gp -i i  | sed 's/"//g' | sed 's/,//' | gp c |sed -n ${1}p
}

#launch ec2
function startec2() {
    awsc ec2 start-instances --instance-ids $(insidc $@)
}

#stop ec2
function stopec2() {
    awsc ec2 stop-instances --instance-ids $(insidc $@)
}

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/sbin/aws_completer' aws
