#------RUST------#
alias rupdate='rustup update stable'
alias cr='cargo run'
alias cc='cargo check'
alias cb='cargo build'

function flist() {
    ARG="$@"
    fzf --layout reverse --border --border-label="$ARG" --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

function rusty() {
    pushd ~/programming/rusticean
        v $(fd -e rs | flist "RUSTY")
}
