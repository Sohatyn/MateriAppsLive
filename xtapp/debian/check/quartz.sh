#!/bin/sh

set -x

XTAPP_PS_DIR=/usr/share/xtapp/pseudo-potential/PS

rm -f fort.*
cp -p quartz.cg fort.10
cp -p $XTAPP_PS_DIR/ps-Si fort.34
cp -p $XTAPP_PS_DIR/ps-O fort.35
time xtapp inipot > quartz-initpot.log

time mpirun -np 1 xtapp cgmrpt > quartz-cgmrpt.log
mv fort.11 quartz.lpt
mv fort.25 quartz.rho
mv fort.96 quartz.wfn
mv fort.99 quartz.str
