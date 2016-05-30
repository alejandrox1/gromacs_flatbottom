#!/bin/bash

#mkdir exec
cd source

module purge
module load intel
module load impi
module load cmake/2.8.9
#module load mvapich2

export FFTW_LOCATION=$(pwd)/../../fftw-3.3.3_sse2/exec
export CPPFLAGS=-I$FFTW_LOCATION/include
export LDFLAGS=-L$FFTW_LOCATION/lib

export CC=mpicc 
export CXX=mpicxx

#cmake ../source/ \
#      -DCMAKE_PREFIX_PATH=$FFTW_LOCATION \
#      -DCMAKE_INSTALL_PREFIX=$(pwd) \
#      -DGMX_X11=OFF \
#      -DCMAKE_CXX_COMPILER=${CXX} \
#      -DCMAKE_C_COMPILER=${CC} \
#      -DGMX_PREFER_STATIC_LIBS=ON \
#      -DGMX_MPI=ON
#make -j4 mdrun
#make -j4 install-mdrun


./configure --prefix=$(pwd) --disable-shared --without-motif-includes --without-motif-libraries --without-x --without-xml --enable-mpi --program-suffix="_mpi" >output.configure.mpi 2>&1
make -j4  >output.make.mpi 2>&1
make -j4 install-mdrun  >output.make_install.mpi 2>&1
cp bin/mdrun_mpi ../exec/bin
touch DONE_PARALLEL
##make distclean


