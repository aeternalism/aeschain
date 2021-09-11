#!/bin/bash
APP_BINARY="aeschaind"
USER=${1:-$USER}
APP_HOME="/home/${USER}/.aeschain"
GOPATH="/home/${USER}/go"

# Must run with root shell
cat > /etc/systemd/system/aes.service << EOF
[Unit]
Description=Aeschain Service
After=network-online.target

[Service]
User=${USER}
ExecStart=${GOPATH}/bin/cosmovisor start
Restart=always
RestartSec=3
LimitNOFILE=infinity

Environment="DAEMON_HOME=${APP_HOME}"
Environment="DAEMON_NAME=${APP_BINARY}"
Environment="DAEMON_ALLOW_DOWNLOAD_BINARIES=false"
Environment="DAEMON_RESTART_AFTER_UPGRADE=true"

[Install]
WantedBy=multi-user.target
EOF

# reload daemon
systemctl daemon-reload
systemctl enable aes.service
systemctl start aes.service
