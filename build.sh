#!/bin/bash

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

# Debian 7.7 / Ubuntu 14.04 (gcc 4.7+)
#extracflags="$extracflags -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores"

#CFLAGS="-O3 -march=native -Wall" ./configure --with-curl --with-crypto=$HOME/usr
CFLAGS="-Ofast -march=native -Wall" ./configure --with-curl
#CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl

make -j 4

strip -s minerd

