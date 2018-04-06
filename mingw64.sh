#!/bin/bash

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

LDFLAGS="-L depend/curl-7.38.0-devel-mingw64/lib64 -static" LIBCURL="-lcurldll" CFLAGS="-Ofast -march=native" ./configure --host=x86_64-w64-mingw32 --with-libcurl=depend/curl-7.38.0-devel-mingw64

make -j 4

strip -p --strip-debug --strip-unneeded cpuminer.exe

