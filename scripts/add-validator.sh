#!/bin/bash
CHAIN_ID="aeternalism"
MONIKER=$1
STAKE_KEY=$2
APP_HOME=${3:-$HOME/.aeschain}
STAKE_AMOUNT=${4:-100000000000uaes}
WEBSITE=${4:-https://aeslabs.one}
DETAILS=${5:-Foundation Node}

# add validator to genesis
aeschaind tx staking create-validator \
  --amount ${STAKE_AMOUNT} \
  --pubkey $(aeschaind tendermint show-validator --home ${APP_HOME}) \
  --moniker ${MONIKER} \
  --chain-id ${CHAIN_ID} \
  --commission-rate "0.10" \
  --commission-max-rate "0.20" \
  --commission-max-change-rate "0.01" \
  --min-self-delegation "1000000" \
  --gas "auto" \
  --gas-adjustment 1.2 \
  --keyring-backend "file" \
  --website ${WEBSITE} \
  --details ${DETAILS} \
  --from ${STAKE_KEY}
