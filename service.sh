echo "[Unit]
Description=
After=network.target

StartLimitIntervalSec=500
StartLimitBurst=5

[Service]
Type=simple
User="$USER"
ExecStart="$PWD/daemon"
WorkingDirectory="$PWD"

Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target" | sudo tee  /lib/systemd/system/thinkmaydaemon.service


sudo systemctl daemon-reload
sudo systemctl restart thinkmaydaemon
journalctl -f -u thinkmaydaemon