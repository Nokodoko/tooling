function jirah() {
 cat ~/.zsh/tooling/jira.zsh|gp jira
}

#-----issues-----#
alias jic='jira issue create'
alias jica='jira issue comment add'
alias jim='jira issue move'
alias jil='jira issue list'
alias jild='jira issue list -s"To Do"'
alias jiv='jira issue view'
alias jilm='jira issue list -s~Done -a$(jira me)'


#-----epic-----#
alias jel='jira epic list'
alias jelm='jira epic list -a$(jira me)'
