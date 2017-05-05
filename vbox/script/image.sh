#!/usr/bin/env bash

set -eux
CODENAME=$(lsb_release -cs)

if [ -f /tmp/malive/splash/splash-${CODENAME}.svn.in ]; then
    cp /tmp/malive/splash/splash-${CODENAME}.svn.in /usr/share/images/desktop-base/login-background.svg
fi
