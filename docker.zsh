#------DOCKER------#
alias d='docker'
alias dstop='docker stop'
alias drun='~/scripts/drun.sh'
alias drunrm='~/scripts/drunrm.sh'
alias dexec='~/scripts/dexec.sh'
alias drm='~/scripts/drm.sh'
alias ds='docker stop'
alias darch='docker run -dit archlinux/base'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dpl='docker ps -l'
alias dnl='docker network ls'
alias di='docker images'
alias dni='docker network inspect'
alias dpull='docker pull'
alias dh='docker history'
alias dt='docker tag'
alias dbt='docker build -t'
alias db='docker build .'
alias dprune='docker image prune'
alias dsysp='docker system prune -a'
alias dlog='~/scripts/dlog.sh'
alias dfollow='docker logs -f'
alias did='docker login'
alias dvol-c='docker volume create'
alias dvol-l='docker volume ls'
alias dvol-r='docker volume rm'
alias dvol-i='docker volume inspect'
alias dvol-p='docker volume prune'
alias ds='dockerscan'
alias dswarm='docker swarm init'
alias swarmjoin='docker swarm join-token'
alias dc='docker-compose'

#------FUNCTIONS------#
function dcn() {
        docker network inspect bridge -f '{{ .Containers }}'
} 

function dipa() {
        docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
} 

function dserv() { # $1=serviceName; $2=portNumber; $3=imageName
        docker service create --name $1 -p $2 $3
        } 

function dic() { # $1= running containerName tw
        docker inspect $1 | gp Mount -A 10
        
        } 

function dmount() { # $1=containerName; $2=volumeName ; $3=containerPath to mount
        docker run -d --name $1 --mount source=$2,destination=$3
        
        } 

function dmountsize() { # $1=containerName; $2=volumeName ; $3=containerPath to mount
        docker run -d --name $1 --mount source=$2,$2-size=$3,destination=$4
        
        } 
function dcurl() {
        curl http://localhost:$1
        } 

function dstart() { # $1 = container sha or tag
        docker restart $1
        } 

#function dremount() {
#        docker run -d --name $1 mount $2 
#        
#}  

function dname() { # $1=name; $2=Image; 
        docker run -dit --name $1 $2 
        } 

function dport() { # $1=name; $2=ports; $3 = Image#
        docker run -dit --name $1 -p $2 $3
        }

function dshell() { # $1=name; $2=image; $3=shell interpreter
        docker run -it --name $1 $2 $3
        } 

#function dexec() { # $1=shell interpreter
#        dp > ~/running_containers
#        local ID=$(awk 'FNR == 2 {print $1}' ~/running_containers) # ID = Container hash
#        docker exec -it $ID $1 
#        rm ~/running_containers
#        } 

function dbuild() { # $1=
        docker build -t n0ko/$1 -f Dockerfile .
        }  

function dpush() {
        docker push n0ko/$1
        
        } 
