#!/bin/bash

mkdir exec
cd exec

#export GROMACS_LOCATION=$(pwd)/exec
#export CPPFLAGS=-I$FFTW_LOCATION/include
#export LDFLAGS=-L$FFTW_LOCATION/lib

module purge
module load intel/13.0.2.146
module load cmake/2.8.9
export FFTW_LOCATION=$(pwd)/../../fftw-3.3.3_sse2/exec
export CXX=icpc
export CC=icc
cmake ../source/ \
	-DCMAKE_PREFIX_PATH=$FFTW_LOCATION \
      	-DCMAKE_INSTALL_PREFIX=$(pwd) \
      	-DGMX_X11=OFF \
      	-DCMAKE_CXX_COMPILER=${CXX} \
	-DCMAKE_C_COMPILER=${CC} \
	-DGMX_PREFER_STATIC_LIBS=ON \
        -DGMX_MPI=OFF > output.config 2>&1


#./configure --prefix=$GROMACS_LOCATION --without-motif-includes --without-motif-libraries --without-x --without-xml #>output.configure 2>&1
make -j4 >output.make 2>&1
make -j4 install  >output.make_install 2>&1
touch DONE_SERIAL
##make distclean


