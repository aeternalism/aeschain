#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1

# init chain
aeschaind init ${MONIKER} --chain-id ${CHAIN_ID} --home ${APP_HOME}

# override genesis
# curl https://raw.githubusercontent.com/aeternalism/aeschain-version/main/hydrogen/testnet/genesis.json > ${APP_HOME}/config/genesis.json

# validate genesis
aeschaind validate-genesis
