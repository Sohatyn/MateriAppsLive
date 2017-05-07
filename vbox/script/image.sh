#!/usr/bin/env bash

set -eux
CODENAME=$(lsb_release -cs)

if [ -f /tmp/malive/splash/splash-${CODENAME}.svg.in ]; then
    cp /tmp/malive/splash/splash-${CODENAME}.svg.in /usr/share/images/desktop-base/login-background.svg
fi
