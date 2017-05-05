#!/usr/bin/env bash

set -eux

# Set up sudo.  Be careful to set permission BEFORE copying file to sudoers.d
( cat <<EOP
%user ALL=(ALL) NOPASSWD:ALL
EOP
) > /tmp/user
chmod 0440 /tmp/user
mv /tmp/user /etc/sudoers.d/
