#!/bin/bash
KEY=$1
APP_HOME=${2:-$HOME/.aeschain}

# add keys
aeschaind keys mnemonic
aeschaind keys add "${KEY}" --recover --keyring-backend file --home ${APP_HOME}
