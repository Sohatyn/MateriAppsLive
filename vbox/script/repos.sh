#!/usr/bin/env bash

set -eux
CODENAME=$(lsb_release -cs)

apt-get update
apt-get -y install wget apt-transport-https
wget http://jaist.dl.sourceforge.net/project/materiappslive/Debian/sources/materiapps-${CODENAME}.list
mv materiapps-${CODENAME}.list /etc/apt/sources.list.d/
apt-get update
apt-get --allow-unauthenticated install materiapps-keyring
apt-get update

# materiapps
apt-get install -y akaikkr
apt-get install -y alps-applications alps-tutorials libalps-dev
