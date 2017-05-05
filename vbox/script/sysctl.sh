#!/usr/bin/env bash

set -eux

echo "kernel.shmmax = 1073741824" > /etc/sysctl.d/local.conf
