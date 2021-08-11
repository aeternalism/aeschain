#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1
FOUNDATION="AesLabs"
FOUNDATION_AMOUNT=100000000000000aes
STAKE_AMOUNT=1000000000000aes

# init chain
# generate genesis.json & config files
aeschaind init ${MONIKER} --chain-id ${CHAIN_ID} --home ${APP_HOME}

# change denom to aes
sed -i -r 's/stake/aes/g' ${APP_HOME}/config/genesis.json

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
  --chain-id ${CHAIN_ID}

aeschaind collect-gentxs

# validate genesis
aeschaind validate-genesis
