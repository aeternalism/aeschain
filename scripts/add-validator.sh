#!/bin/bash
CHAIN_ID=${1:-"aeternalism"}
MONIKER=$2
STAKE_KEY=$3
APP_HOME=${4:-$HOME/.aeschain}
STAKE_AMOUNT=${5:-100000000000uaes}
WEBSITE=${6:-https://aes.michan}
DETAILS=${7:-Michan Node}

# add validator to genesis
aeschaind tx staking create-validator \
  --amount ${STAKE_AMOUNT} \
  --pubkey $(aeschaind tendermint show-validator --home ${APP_HOME}) \
  --moniker "${MONIKER}" \
  --chain-id ${CHAIN_ID} \
  --commission-rate "0.10" \
  --commission-max-rate "0.20" \
  --commission-max-change-rate "0.01" \
  --min-self-delegation "1000000" \
  --gas "auto" \
  --gas-adjustment 1.2 \
  --keyring-backend "file" \
  --website "${WEBSITE}" \
  --details "${DETAILS}" \
  --from "${STAKE_KEY}" \
  --home ${APP_HOME} \
  --yes
