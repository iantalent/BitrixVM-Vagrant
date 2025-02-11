#!/bin/bash

# update before installation
dnf clean all && dnf update -y

# download bitrixVM and execute
wget http://repo.bitrix.info/dnf/bitrix-env-9.sh && chmod +x bitrix-env-9.sh && ./bitrix-env-9.sh -s -p -H server -M "password"
