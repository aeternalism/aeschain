#!/bin/bash
APP_HOME="${HOME}/.aeschain"
APP_BINARY="aeschaind"

# check GOPATH
if [ -z "${GOPATH}" ]; then
  echo "Not found GOPATH"
  exit 1
fi

# install cosmovisor
cd ${GOPATH}
go get github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor

# init cosmovisor directory
mkdir -p ${APP_HOME}/cosmovisor/genesis/bin
cp $(which ${APP_BINARY}) ${APP_HOME}/cosmovisor/genesis/bin
