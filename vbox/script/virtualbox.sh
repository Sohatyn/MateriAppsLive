#!/bin/bash -eux

echo "==> Installing VirtualBox guest additions"
apt-get install -y linux-headers-$(uname -r) build-essential perl
apt-get install -y dkms

VBOX_VERSION=$(cat /home/user/.vbox_version)
mount -o loop /home/user/VBoxGuestAdditions_${VBOX_VERSION}.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm /home/user/VBoxGuestAdditions_${VBOX_VERSION}.iso
rm /home/user/.vbox_version
