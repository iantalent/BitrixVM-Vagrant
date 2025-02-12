#!/bin/bash

# update before installation
dnf clean all && dnf update -y

# Disable SELinux
sed -i '/\(^SELINUX=\).*/ s//\1disabled/' /etc/sysconfig/selinux

grubby --update-kernel ALL --args selinux=0

# create if not exists
id -u bitrix &> /dev/null || useradd --no-create-home bitrix

# change /home/bitrix owner
chown bitrix:bitrix /home/bitrix
