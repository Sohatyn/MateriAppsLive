#!/bin/bash -eux

echo "==> Disk usage before minimization"
df -h

echo "==> Installed packages before cleanup"
dpkg --get-selections | grep -v deinstall

# Remove some packages to get a minimal install
echo "==> Removing iceweasel gksu lxmusic xterm"
apt-get -y purge iceweasel gksu lxmusic xterm
echo "==> Removing obsolete networking components"
apt-get -y purge ppp pppconfig pppoeconf
echo "==> Removing other oddities"
apt-get -y purge popularity-contest installation-report wireless-tools
echo "==> Removing default system Python"
apt-get -y purge python-dbus libnl1 python-smartpm python-twisted-core python-twisted-bin python-pexpect python-pycurl python-serial python-pam python-openssl
echo "==> Removing libreoffice"
dpkg --list | awk '{print $2}' | grep libreoffice | xargs apt-get -y purge
echo "==> Removing libsane"
dpkg --list | awk '{print $2}' | grep libsane | xargs apt-get -y purge
echo "==> Removing xsane"
dpkg --list | awk '{print $2}' | grep xsane | xargs apt-get -y purge

# Clean up the apt cache
echo "==> Cleaning up the apt cache"
apt-get -y autoremove --purge
apt-get -y autoclean
apt-get -y clean

echo "==> Removing man pages"
find /usr/share/man -type f -delete
echo "==> Removing APT files"
find /var/lib/apt -type f -delete
echo "==> Removing any docs"
find /usr/share/doc -type f -delete
echo "==> Removing caches"
find /var/cache -type f -delete
echo "==> Removing groff info lintian linda"
rm -rf /usr/share/groff/* /usr/share/info/* /usr/share/lintian/* /usr/share/linda/*

echo "==> Disk usage after cleanup"
df -h
