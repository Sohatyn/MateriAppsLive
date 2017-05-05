#!/bin/sh
. ./version.sh
sh ./setup.sh

OVA="MateriAppsLive-${MALIVE7_VERSION}-i386.ova"
if [ -f "ova/$OVA" ]; then
  echo "Warning: ova/$OVA exists. Skip."
else
  sed -e "s|@DEBIAN7_VERSION@|${DEBIAN7_VERSION}|g" \
      -e "s|@DEBIAN7_CHECKSUM@|${DEBIAN7_I386_CHECKSUM}|g" \
      -e "s|@MALIVE7_VERSION@|${MALIVE7_VERSION}|g" \
      debian7-i386.json.in > debian7-i386.json
  mkdir -p log
  packer build -var-file=debian7-i386.json debian.json 2>&1 | tee log/build-debian7-i386.log
  if [ -f "output-virtualbox-iso/$OVA" ]; then
    mkdir -p ova
    mv -f output-virtualbox-iso/${OVA} ova/${OVA}
    rm -rf output-virtualbox-iso
  fi
fi
