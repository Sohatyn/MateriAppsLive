#!/bin/sh

set -x

XTAPP_PS_DIR=/opt/MateriApps/xtapp/xtapp-140916-2/pseudo-potential/PBE/PS

# export GIOUNIT_DEBUG=1

rm -f fort.* al.lpt al.rho al.str al.wfn *.log
export FORT10=al.cg
export FORT34=$XTAPP_PS_DIR/ps-Al
export FORT28=$XTAPP_PS_DIR/ps-Al.ichr
inipot > inipot.log

export FORT11=al.lpt
export FORT96=al.wfn
export FORT99=al.str
cgmrpt > cgmrpt.log
