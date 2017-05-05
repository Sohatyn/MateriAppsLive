#!/usr/bin/env bash

set -eux

if [ -f /tmp/malive/menu/lxde-applications.menu ]; then
    echo "==> Copying lxde-applications.menu to /etc/xdg/menus/"
    cp -r /tmp/malive/menu/lxde-applications.menu /etc/xdg/menus/
fi
