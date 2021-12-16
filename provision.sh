#!/bin/sh

# update mirrors
apt update

# install gns3 dependencies
apt install -y python3-pip python3-pyqt5 python3-pyqt5.qtsvg \
python3-pyqt5.qtwebsockets \
qemu qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst \
wireshark xtightvncviewer apt-transport-https \
ca-certificates curl gnupg2 software-properties-common

# install gns3 server and gui via pip
pip3 install gns3-server==2.2.27
pip3 install gns3-gui==2.2.27

IPV4_ADDRESS=$(ip a show dev eth0 | grep "inet " | sed 's/.*inet //;s/\/24.*//')
echo "local ipv4 address: $IPV4_ADDRESS"