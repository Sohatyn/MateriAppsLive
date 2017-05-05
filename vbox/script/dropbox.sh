#!/usr/bin/env bash

set -eux
CODENAME=$(lsb_release -cs)

echo "deb http://linux.dropbox.com/debian ${CODENAME} main" > /etc/apt/sources.list.d/dropbox.list
apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
apt-get update
apt-get -y install dropbox
