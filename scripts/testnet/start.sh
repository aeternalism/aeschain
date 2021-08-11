#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"
MONIKER=$1

# get seeds
# SEEDS=$(curl https://raw.githubusercontent.com/aeternalism/aeschain-version/main/hydrogen/testnet/seeds)
SEEDS=574fbc6543ab45c3559ea1ecb8e3e45576b93a72@52.220.154.234:26656

# run the node
aeschaind start \
  --moniker ${MONIKER} \
  --consensus.create_empty_blocks false \
  --p2p.seeds ${SEEDS} \
  --p2p.persistent_peers ${SEEDS}
