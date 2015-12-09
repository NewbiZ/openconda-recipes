#!/bin/sh

./configure --prefix=$PREFIX \
    CFLAGS="-I$PREFIX/include" \
    LDFLAGS="-L$PREFIX/lib -Wl,-rpath,'\$\$ORIGIN'/../lib -Wl,-z,origin"

make
make install
