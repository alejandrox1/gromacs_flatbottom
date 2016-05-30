#!/bin/bash

module purge
module load intel/13.0.2.146
export FFTW_LOCATION=$(pwd)
export CC=icc
export CXX=icpc

./configure --enable-float --enable-threads --prefix=${FFTW_LOCATION} --enable-sse2 

make -j4
make -j4 install
