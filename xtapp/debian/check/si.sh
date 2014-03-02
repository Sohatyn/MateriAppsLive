#!/bin/sh

set -x

XTAPP_PS_DIR=/usr/share/xtapp/pseudo-potential/PS

# export GIOUNIT_DEBUG=1

rm -f fort.* si.lpt si.rho si.str si.wfn *.log
export FORT10=si.cg
export FORT34=$XTAPP_PS_DIR/ps-Si
time inipot > si-inipot.log

export FORT96=si.wfn
export FORT99=si.str
time cgmrpt > si-cgmrpt.log

export FORT10=si.pef
export FORT11=si.lpt
export FORT25=si.rho
export FORT50=si.band
time vbpef > si-vbpef.log
