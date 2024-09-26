#!/bin/bash

# UFW (Uncomplicated Firewall)
if [[ $(ufw --version) != '' ]]; then

    Rules
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow ssh
    ufw enable

    if [[ $(ufw status | head -n 1) == "Status: active" ]]; then
        echo "Firewall configured to only accept SSH connections"
    else
        echo "Error on active Firewall"
    fi
else
    apt install ufw
    ./firewall.sh
fi