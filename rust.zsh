#------RUST------#
alias rupdate='rustup update stable'
alias cr='cargo run'
alias cc='cargo check'
alias cb='cargo build'

function cri() {
    pushd ~/programming/rust || exit 1
        cargo init "$@" && \
            pushd "$@" && \
            v $(fd -e rs) 
}

function rusty() {
    v $(fd -e rs . --full-path ~/programming/rust/ | flist "Rusty")
    #pushd ~/programming && v $(fd -e rs | $(flist "Rusty"))
}



#-------------------------CARGO-------------------------#
function ci() {
    cargo install $1
}
