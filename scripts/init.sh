#!/bin/bash
CHAIN_ID="aeternalism"
MONIKER=$1
APP_HOME=${2:-$HOME/.aeschain}
FOUNDATION="AesLabs"
FOUNDATION_AMOUNT=100000000000000uaes
STAKE_AMOUNT=1000000000000uaes

# init chain
# generate genesis.json & config files
aeschaind init ${MONIKER} --chain-id ${CHAIN_ID} --home ${APP_HOME}

# change denom to uaes
# 1 aes = 1000000 uaes
sed -i -r 's/stake/uaes/g' ${APP_HOME}/config/genesis.json

# add foundation & validator keys
if ! aeschaind keys show -a ${FOUNDATION} --keyring-backend file; then 
  aeschaind keys add ${FOUNDATION} --recover --keyring-backend file
fi
if ! aeschaind keys show -a ${MONIKER} --keyring-backend file; then 
  aeschaind keys add ${MONIKER} --recover --keyring-backend file
fi

# add genesis accounts
aeschaind add-genesis-account $(aeschaind keys show -a ${FOUNDATION} --keyring-backend file) ${FOUNDATION_AMOUNT}
aeschaind add-genesis-account $(aeschaind keys show -a ${MONIKER} --keyring-backend file) ${STAKE_AMOUNT}

# add validator to genesis
aeschaind gentx ${MONIKER} ${STAKE_AMOUNT} \
  --keyring-backend file \
  --chain-id ${CHAIN_ID} \
  --moniker ${MONIKER} \
  --commission-rate "0.20" \
  --commission-max-rate "0.3" \
  --commission-max-change-rate "0.01" \
  --website "https://aeslabs.one"
  --details "Foundation Node - Claude Monet"

aeschaind collect-gentxs

# validate genesis
aeschaind validate-genesis
