cjauth () {
    cj='/home/n0ko/.config/neomutt/tokens/cj/'
    pushd $cj

    if [[ -f $cj ]]; then
    rm chrismontgomeryjr@gmail.com &&
    ./mutt_oauth2.py chrismontgomeryjr@gmail.com --authorize
    else
    ./mutt_oauth2.py chrismontgomeryjr@gmail.com --authorize
    fi
}

614auth() {
    614='/home/n0ko/.config/neomutt/tokens/cMonty614/'

    pushd $614
    if [[ -f $614 ]]; then
    rm cMonty614@gmail.com &&
    ./mutt_oauth2.py cMonty614@gmail.com --authorize
    else
    ./mutt_oauth2.py cMonty614@gmail.com --authorize
    fi
}
