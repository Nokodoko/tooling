#-----accounts-----#
function gcm() {
    gcloud config set account cmonty614@gmail.com
    echo "cmonty614@gmail.com"
}

function gcj() {
    gcloud config set account chrismontgomeryjr@gmail.com
    echo "chrismontgomeryjr@gmail.com"
}

#-----aliases-----#
function gcl() {
    gcloud $@
}
