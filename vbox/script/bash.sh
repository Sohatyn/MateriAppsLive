#!/usr/bin/env bash

set -eux

# add $HOME/bin to search path
cat << EOF >> /etc/profile.d/home-bin.sh
export PATH=\$HOME/bin:\$PATH
EOF
