#!/bin/bash

mkdir exec

module purge
module load intel/13.0.2.146
module load impi
#module load cmake/2.8.9
export FFTW_LOCATION=$(pwd)/../fftw-3.3.3_sse2/exec
export GMX_LOC=$(pwd)/exec
export CPPFLAGS=-I$FFTW_LOCATION/include
export LDFLAGS=-L$FFTW_LOCATION/lib
export CXX=icpc
export CC=icc

cd source
./configure --prefix=$GMX_LOC --without-motif-includes --without-motif-libraries \
    --without-x --without-xml --enable-mpi --program-suffix="_mpi" #>output.configure 2>&1
make #> output.make.mpi 2>&1
make install #> output.make_install.mpi 2>&1
#touch DONE_PARALLEL

cd ..