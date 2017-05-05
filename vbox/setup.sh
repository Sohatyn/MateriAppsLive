#!/bin/sh

. ./version.sh

if [ -d "malive" ]; then 
  echo "Warning: malive exists. Skip."
else
  mkdir -p malive/splash
  _YEAR="$(date +%Y)"
  _MONTH="$(date +%m)"
  _DAY="$(date +%d)"
  _HOUR="$(date +%H)"
  _MINUTE="$(date +%M)"
  _SECOND="$(date +%S)"
  _PROJECT="Debian GNU/Linux 7 (wheezy)"
  sed -e "s|@MA_VERSION@|${MALIVE7_VERSION}|g" \
      -e "s|@PROJECT@|${_PROJECT}|g" \
      -e "s|@YEAR@|${_YEAR}|g" \
      -e "s|@MONTH@|${_MONTH}|g" \
      -e "s|@DAY@|${_DAY}|g" \
      -e "s|@HOUR@|${_HOUR}|g" \
      -e "s|@MINUTE@|${_MINUTE}|g" \
      -e "s|@SECOND@|${_SECOND}|g" \
      ../live/config/bootloaders-wheezy/isolinux/splash.svg.in > malive/splash/splash-wheezy.svg.in
  _PROJECT="Debian GNU/Linux 8 (jessie)"
  sed -e "s|@MA_VERSION@|${MALIVE8_VERSION}|g" \
      -e "s|@PROJECT@|${_PROJECT}|g" \
      -e "s|@YEAR@|${_YEAR}|g" \
      -e "s|@MONTH@|${_MONTH}|g" \
      -e "s|@DAY@|${_DAY}|g" \
      -e "s|@HOUR@|${_HOUR}|g" \
      -e "s|@MINUTE@|${_MINUTE}|g" \
      -e "s|@SECOND@|${_SECOND}|g" \
      ../live/config/bootloaders-wheezy/isolinux/splash.svg.in > malive/splash/splash-jessie.svg.in

  mkdir -p malive/menu
  cp ../live/config/includes.chroot/etc/xdg/menus/lxde-applications.menu malive/menu
fi
