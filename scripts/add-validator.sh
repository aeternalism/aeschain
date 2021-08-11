#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1
STAKE_KEY=$2
STAKE_AMOUNT=100000000000aes
WEBSITE="https://aeslabs.one"
DETAILS="Foundation validator"

# add validator to genesis
aeschaind tx staking create-validator \
  --amount ${STAKE_AMOUNT} \
  --pubkey $(aeschaind tendermint show-validator) \
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
