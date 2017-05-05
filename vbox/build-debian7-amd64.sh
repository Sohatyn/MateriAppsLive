#!/bin/sh
. ./version.sh
sh ./setup.sh

OVA="MateriAppsLive-${MALIVE7_VERSION}-amd64.ova"
if [ -f "ova/$OVA" ]; then
  echo "Warning: ova/$OVA exists. Skip."
else
  sed -e "s|@DEBIAN7_VERSION@|${DEBIAN7_VERSION}|g" \
      -e "s|@DEBIAN7_CHECKSUM@|${DEBIAN7_AMD64_CHECKSUM}|g" \
      -e "s|@MALIVE7_VERSION@|${MALIVE7_VERSION}|g" \
      debian7-amd64.json.in > debian7-amd64.json
  mkdir -p log
  packer build -var-file=debian7-amd64.json debian.json 2>&1 | tee log/build-debian7-amd64.log
  if [ -f "output-virtualbox-iso/$OVA" ]; then
    mkdir -p ova
    mv -f output-virtualbox-iso/${OVA} ova/${OVA}
    rm -rf output-virtualbox-iso
  fi
fi
