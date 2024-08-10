#!/bin/bash
VW_USER="vaultwarden"
NFS_DIR="192.168.1.105:/mnt/NAS/Storage/Vaultwarden"

# install packages
apk update
apk upgrade
apk add nano docker docker-cli-compose nfs-utils git

# user/docker setup
adduser -g "${VW_USER}" $VW_USER -D
addgroup root docker
addgroup $VW_USER docker

# nfs setup
rc-update add nfsmount
mkdir -p /home/$VW_USER/backup-data
echo "$NFS_DIR /home/$VW_USER/backup-data nfs noatime 0 0" >> /etc/fstab

# start docker
rc-update add docker default
service docker start

# clone repository
git clone https://github.com/Creaous/vaultwarden-docker.git /home/$VW_USER
chown -R $VW_USER:$VW_USER /home/$VW_USER
chmod -R 755 /home/$VW_USER

# setup is finished
echo "Setup complete!"
echo "Please reboot to complete the installation."
