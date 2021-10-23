#!/bin/bash
CHAIN_ID=${1:-"aeternalism"}
MONIKER=$2
APP_HOME=${3:-$HOME/.aeschain}
SEEDS_URL=${4:-https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/seeds}
GENESIS_URL=${5:-https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/genesis.json}

# get seeds
SEEDS=$(curl ${SEEDS_URL})

# check for existed genesis
GENESIS=${APP_HOME}/config/genesis.json
if [ ! -f "$GENESIS" ]; then 
  # init chain
  aeschaind init "${MONIKER}" --chain-id ${CHAIN_ID} --home ${APP_HOME}

  # override genesis
  curl ${GENESIS_URL} > ${APP_HOME}/config/genesis.json

  # validate genesis
  aeschaind validate-genesis --home ${APP_HOME}

  # configure chain
  ## P2P
  sed -i -r "s/seeds = \"\"/seeds = \"${SEEDS}\"/" ${APP_HOME}/config/config.toml

  ## Consensus
  sed -i -r 's/create_empty_blocks = true/create_empty_blocks = false/' ${APP_HOME}/config/config.toml

  ## Metrics
  sed -i -r 's/prometheus = false/prometheus = true/' ${APP_HOME}/config/config.toml
fi

# run the node
aeschaind start \
  --moniker "${MONIKER}" \
  --consensus.create_empty_blocks false \
  --p2p.seeds ${SEEDS} \
  --home ${APP_HOME}
  