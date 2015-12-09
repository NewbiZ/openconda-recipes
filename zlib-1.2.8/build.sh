#!/bin/sh

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --includedir=$PREFIX/include
make
make install
