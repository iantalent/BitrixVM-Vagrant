#!/bin/bash

echo "Installing BitrixVM"

# download bitrixVM and execute
wget http://repo.bitrix.info/dnf/bitrix-env-9.sh && chmod +x bitrix-env-9.sh && ./bitrix-env-9.sh -s -p -H server1

echo "Removing root user /root/menu.sh autostart"

sed -i '/\(^~\/menu\.sh\).*/ s//#\1/' /root/.bash_profile
