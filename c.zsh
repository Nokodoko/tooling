#------C------#
function cc(){
    gcc $1 -Wall -o $2
    ./$2
}
