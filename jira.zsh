function jirah() {
 cat ~/.zsh/tooling/jira.zsh|gp jira
}

alias jic='jira issue create'
alias jica='jira issue comment add'
alias jim='jira issue move'
alias jil='jira issue list'
alias jiv='jira issue view'
alias jilm='jira issue list -s~Done -a$(jira me)'
alias jel='jira epic list'
alias jelm='jira epic list -a$(jira me)'
