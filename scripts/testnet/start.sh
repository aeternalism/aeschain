#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1

# get seeds
SEEDS=$(curl https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/testnet/seeds)

# run the node
aeschaind start \
  --moniker ${MONIKER} \
  --consensus.create_empty_blocks false \
  --p2p.seeds ${SEEDS} \
  --p2p.persistent_peers ${SEEDS}
