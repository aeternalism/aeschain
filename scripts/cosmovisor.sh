#!/bin/bash
APP_BINARY="aeschaind"
APP_HOME="${1:-$HOME/.aeschain}"

# install cosmovisor
cd $(go env GOPATH)
go get github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor

# init cosmovisor directory
mkdir -p ${APP_HOME}/cosmovisor/genesis/bin
cp $(which ${APP_BINARY}) ${APP_HOME}/cosmovisor/genesis/bin
