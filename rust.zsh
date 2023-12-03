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
    v $(fd -e rs . --full-path ~/programming/rust_projects/ | flist "Rusty")
    #pushd ~/programming && v $(fd -e rs | $(flist "Rusty"))
}



#-------------------------CARGO-------------------------#
function ci() {
    cargo install $1
}

function flist() {
    ARG="$@"
    fzf --layout reverse --border --border-label="$ARG" --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

function rusty() {
    pushd ~/programming/rusticean
    v $(fd -e rs | flist "RUSTY")
}
