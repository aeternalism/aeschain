FROM aeslabs/aeschain-base

# Mount directory for data
VOLUME ["/aeschain"]
# Moniker 
ENV MONIKER="AesDockerNode"

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
ENTRYPOINT ["sh", "-c", "/aeschain-entrypoint/init.sh ${MONIKER} /aeschain"]
