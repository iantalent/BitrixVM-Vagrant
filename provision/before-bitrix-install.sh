#!/bin/bash

# update before installation
dnf clean all && dnf update -y

echo "Disable SELinux"

# Disable SELinux
sed -i '/\(^SELINUX=\).*/ s//\1disabled/' /etc/sysconfig/selinux

grubby --update-kernel ALL --args selinux=0

# create if not exists
useradd bitrix

mkdir /var/vagrant_synced/www
mkdir /var/vagrant_synced/ext_www

chown bitrix:bitrix /var/vagrant_synced/www
chown bitrix:bitrix /var/vagrant_synced/ext_www

ln -s /var/vagrant_synced/www /home/bitrix/www
ln -s /var/vagrant_synced/ext_www /home/bitrix/ext_www
