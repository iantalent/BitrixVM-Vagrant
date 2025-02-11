#!/bin/bash

# update before installation
dnf clean all && dnf update -y

# Disable SELinux
sed -i '/\(^SELINUX=\).*/ s//\1disabled/' /etc/sysconfig/selinux

grubby --update-kernel ALL --args selinux=0
