#!/bin/bash

mkdir exec

#module purge
#module load intel

export FFTW_LOCATION=$(pwd)/../fftw-3.3.3_sse2/exec
export GROMACS_LOCATION=$(pwd)/exec
export CPPFLAGS=-I$FFTW_LOCATION/include
export LDFLAGS=-L$FFTW_LOCATION/lib

#./configure --prefix=$GROMACS_LOCATION --without-motif-includes --without-motif-libraries --without-x --without-xml >output.configure 2>&1
make -j8  >output.make 2>&1
make install -j8  >output.make_install 2>&1
touch DONE_SERIAL
##make distclean


