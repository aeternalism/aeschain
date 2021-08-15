#!/bin/bash
APP_HOME="${HOME}/.aeschain"
CHAIN_ID="aeternalism"

# configure chain
## get seeds
SEEDS=$(curl https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/testnet/seeds)

## P2P
sed -i -r "s/seeds = \"\"/seeds = \"${SEEDS}\"/" ${APP_HOME}/config/config.toml
sed -i -r "s/seeds = \"\"/seeds = \"${SEEDS}\"/" ${APP_HOME}/config/config.toml

## Consensus
sed -i -r 's/create_empty_blocks = true/create_empty_blocks = false/' ${APP_HOME}/config/config.toml

## Metrics
sed -i -r 's/prometheus = false/prometheus = true/' ${APP_HOME}/config/config.toml
