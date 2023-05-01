#aws-completion
export PATH=/local/bin/:$PATH
export AWS_CLI_AUTO_PROMPT=on-partial

#alias awsh='cat ~/.zsh/tooling/aws.zsh'
#alias awslsUsers='~/scripts/awsListUsers.sh'
#alias awsListGroupsForUsers='~/scripts/awsListGroupsForUsers.sh'
alias awslsGroups='aws iam list-groups | gp -i groupname'
#alias awslsInstanceProfiles='~/scripts/awsListInstanceProfiles.sh'
#alias awslsDbInstanceIdentifiers='~/scripts/awsListDbInstanceIdentifiers.sh'
#alias awsDescribeDbInstance='~/scripts/awsDescribeDbInstance.sh'

#reset user-password
#alias awsresetPass='~/scripts/awsResetPass.zsh'

#check caller
alias awsid='aws sts get-caller-identity'

######EC2######
#list ec2 instances (per profile)
alias lsec2c='awsc ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"'
alias lsec2='aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"'

function ec2() {
    aws ec2 describe-instances | gp -B110 -i $1
}

function ec2ip() {
    aws ec2 describe-instances | gp -B110 -i $1 | gp -i ip
}
#list ami-IDs (unfinished!!)
function lsami() {
    aws$1 ec2 describe-instances | gp -i imageid | cut -d: -f2| sed 's/"//g' | sed 's/,//'
}

#aws-cli commands with alternate profile
function awsc(){
    aws $@ --profile cMonty614
}

function awsn(){
    aws $@ --profile n0ko
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

#IAM FUNCTIONS#
function addgrouph(){
    echo "group-name"
}

#####IAM#####
function addgroup(){
    aws iam create-group --group-name $@
}

function awsuserls(){
    aws iam list-users
}

function awsuser(){
    aws iam list-users $@
}

function dnlp-design-sandoxnlp-design-sandoxeletegroup(){
    aws iam delete-group --group-name $@
}

#Adduser
function adduserh(){
    echo "group-name, user-name"
}
function adduser(){
    aws iam add-user-to-group --group-name $1 --user-name $2
}

function listgroups(){
    aws iam list-groups
}

#removeuser
function removeuserh(){
    echo "group-name, user-name"
}
function removeuser(){
    aws iam remove-user-from-group --group-name $1 --user-name $2
}

#addpolicy
function addpolicy(){
    aws iam put-group-policy --group-name $1 --policy-document $2 --policy-name $3
}
function addpolicyh(){
    echo "group-name, policy-document, policy-name\n HINT: use 'file://<fileName>' if the policy is too large!"
}

#get a list of loadbalancer names:
#aws elb describe-load-balancers --query 'LoadBalancerDescriptions[*].TagName'



#####ECR#####
alias ecrRepos='~/scripts/ecrRepos.sh'

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
