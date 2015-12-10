#!/bin/sh

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib -Wl,-z,origin -Wl,-rpath,'\$\$ORIGIN/../lib'"

./config --prefix=$PREFIX

make
make install
