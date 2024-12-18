export EDITOR=vim
export GOLIB="$HOME/.go"
export GOPATH="$GOLIB"

typeset -U path PATH
path=(~/.local/bin ~/.cargo/bin "$GOPATH/bin" $path)
export PATH
