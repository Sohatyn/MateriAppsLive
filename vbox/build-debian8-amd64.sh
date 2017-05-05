#!/bin/sh
. ./version.sh
sh ./setup.sh

OVA="MateriAppsLive-${MALIVE8_VERSION}-amd64.ova"
if [ -f "ova/$OVA" ]; then
  echo "Warning: ova/$OVA exists. Skip."
else
  sed -e "s|@DEBIAN8_VERSION@|${DEBIAN8_VERSION}|g" \
      -e "s|@DEBIAN8_CHECKSUM@|${DEBIAN8_AMD64_CHECKSUM}|g" \
      -e "s|@MALIVE8_VERSION@|${MALIVE8_VERSION}|g" \
      debian8-amd64.json.in > debian8-amd64.json
  mkdir -p log
  packer build -var-file=debian8-amd64.json debian.json 2>&1 | tee log/build-debian8-amd64.log
  if [ -f "output-virtualbox-iso/$OVA" ]; then
    mkdir -p ova
    mv -f output-virtualbox-iso/${OVA} ova/${OVA}
    rm -rf output-virtualbox-iso
  fi
fi
