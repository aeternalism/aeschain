FROM aeslabs/aeschain-base

# Mount directory for data
VOLUME ["/aeschain"]
# Set variables
ENV CHAIN_ID="aeternalism"
ENV MONIKER="AesDockerNode"
ENV APP_HOME="/aeschain/.aeschain"
ENV SEEDS_URL="https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/seeds"
ENV GENESIS_URL="https://raw.githubusercontent.com/aeternalism/aeschain-version/main/oxygen/genesis.json"

# Copy source chain
WORKDIR /aeternalism/aeschain
COPY . .

# Init startup script
COPY ./scripts/entrypoint/up.sh /aeschain-entrypoint/init.sh
RUN chmod +x /aeschain-entrypoint/init.sh

# Build chain
RUN starport chain build
ENV PATH="$PATH:/root/go/bin"

EXPOSE 1317 4500 9090 26656 26657
ENTRYPOINT ["sh", "-c", "/aeschain-entrypoint/init.sh ${CHAIN_ID} \"${MONIKER}\" ${APP_HOME} ${SEEDS_URL} ${GENESIS_URL}"]
