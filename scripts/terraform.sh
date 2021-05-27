#!/bin/bash
read -p "host:" HOSTNAME
while true; do
    read -s -p "Password: " password
    echo
    read -s -p "Password (again): " password2
    echo
    [ "$password" = "$password2" ] && break || echo "Please try again"
done
PASSWD=$password

export HOSTNAME
export PASSWD
DEVICE=$(readlink -f /dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_* | grep -vP '\d') ANSIBLE_SU_PASS=root ansible-playbook terraforming.yaml
