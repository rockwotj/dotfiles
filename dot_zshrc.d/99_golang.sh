export GOBIN="$HOME/.local/bin"
mkdir -p $GOBIN
export GOPATH="$HOME/code/go"
export MAKEFLAGS="-j$(nproc)"
export GOMAXPROCS="$(nproc)"
export CGO_ENABLED=0 # By default
