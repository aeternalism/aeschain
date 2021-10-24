#!/bin/bash
USER_EXEC=${1:-$USER}
GO_BIN=${2:-$(go env GOPATH)/bin}

# Must run with root shell
cat > /etc/systemd/system/faucet.service << EOF
[Unit]
Description=Aeschain Faucet Service
After=network-online.target

[Service]
User=${USER_EXEC}
ExecStart=/usr/local/bin/faucet
Restart=always
RestartSec=3
LimitNOFILE=infinity

Environment="PORT=4500"
Environment="ACCOUNT_NAME=faucet"
Environment="KEYRING_PASSWORD=mustchangebeforeuse"
Environment="KEYRING_BACKEND=file"
Environment="CLI_NAME=aeschaind"
Environment="DENOMS=uaes"
Environment="CREDIT_AMOUNT=100000000"
Environment="MAX_CREDIT=1000000000"
Environment="SDK_VERSION=stargate"
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${GO_BIN}"

[Install]
WantedBy=multi-user.target
EOF

# reload daemon
# systemctl daemon-reload
# systemctl enable faucet.service
# systemctl start faucet.service
