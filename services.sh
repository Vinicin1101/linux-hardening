#!/bin/bash

# Stopping and disabling unnecessary services
SERVICES=("cups" "avahi-daemon" "apache2")

for service in "${SERVICES[@]}"; do
    systemctl stop $service
    systemctl disable $service
    echo "[$service] disabled."
done

# SSH deny root
sed -i -E 's+^#?PermitRootLogin.\++PermitRootLogin no+' /etc/ssh/sshd_config.bkp
systemctl restart sshd

if [[ $(cat /etc/ssh/sshd_config.bkp | grep '^PermitRootLogin') == "PermitRootLogin no" ]]; then
    echo "Remote root access is disabled"
else
    echo "Error on disable remote root access"
fi