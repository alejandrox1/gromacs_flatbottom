#!/bin/bash

#mkdir exec

#module purge
module load mpi/openmpi

export FFTW_LOCATION=$(pwd)/../fftw-3.3.3_sse2/exec
export GROMACS_LOCATION=$(pwd)/exec
#export CPPFLAGS="-I$FFTW_LOCATION/include -I/scinet/gpc/mpi/openmpi/1.4.1-intel-v11.0-ofed/include -I/scinet/gpc/mpi/openmpi/1.4.1-intel-v11.0-ofed/lib"
export CPPFLAGS=-I$FFTW_LOCATION/include
export LDFLAGS=-L$FFTW_LOCATION/lib

#export CC=icc
#export CXX=icpc


./configure --prefix=$GROMACS_LOCATION --without-motif-includes --without-motif-libraries --without-x --without-xml --enable-mpi --program-suffix="_mpi" >output.configure.mpi 2>&1
make  >output.make.mpi 2>&1
make install-mdrun  >output.make_install.mpi 2>&1
touch DONE_PARALLEL
##make distclean


