#!/bin/sh

apt-get update
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible -y
sed -i.bak -e '/Defaults.*requiretty/s/^/#/' /etc/sudoers
sed -i -e '/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/a %vagrant\tALL=(ALL)\tNOPASSWD: ALL' /etc/sudoers
