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
apt-get install -y materiappslive
apt-get install -y akaikkr
apt-get install -y alps-applications alps-tutorials libalps-dev
apt-get install -y bsa
apt-get install -y hphi
if [ ${CODENAME} = "wheezy" ]; then
  apt-get install -y dsqss
  apt-get install -y ermod
  apt-get install -y feram
  apt-get install -y gamess-setup
  apt-get install -y openmx openmx-data openmx-example
  apt-get install -y paraview-wrapper
  apt-get install -y smash
  apt-get install -y xtapp xtapp-util xtapp-ps tapioca c-tools
  apt-get install -y vmd-setup
  apt-get install -y xcrysden-wrapper
  apt-get install -y vesta
fi
