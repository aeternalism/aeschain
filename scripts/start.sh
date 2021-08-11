#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1

# run the node
aeschaind start \
  --moniker ${MONIKER} \
  --consensus.create_empty_blocks false
