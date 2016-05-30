#!/bin/bash

mkdir exec
export FFTW_LOCATION=$(pwd)


./configure --enable-float --enable-threads --prefix=${FFTW_LOCATION} --enable-sse2
make
make install
#make distclean
#
#./configure --enable-threads --prefix=${FFTW_LOCATION} --enable-type-prefix --enable-sse2
#make
#make install

