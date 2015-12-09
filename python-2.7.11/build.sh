#!/bin/sh

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-I$PREFIX/lib"

./configure --prefix=$PREFIX
make
make install
