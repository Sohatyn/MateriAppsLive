#!/bin/sh

set -x

XTAPP_PS_DIR=/usr/share/xtapp/pseudo-potential/PS

rm -f fort.*
cp -p si.cg fort.10
cp -p $XTAPP_PS_DIR/ps-Si fort.34
time xtapp inipot > si-inipot.log

time mpirun -np 1 xtapp cgmrpt > si-cgmrpt.log

cp -p si.pef fort.10
time mpirun -np 1 xtapp vbpef > si-vbpef.log

mv fort.11 si.lpt
mv fort.25 si.rho
mv fort.96 si.wfn
mv fort.99 si.str
mv fort.50 si.band
time xtapp vbpef2gp-lsda si.band > si-vbpef2gp-lsda.log
