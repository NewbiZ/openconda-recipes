#!/bin/sh

./configure --prefix=$PREFIX \
    --without-debug \
    --disable-overwrite \
    --without-ada \
    --without-manpages \
    --with-shared \
    --enable-termcap \
    --with-termlib \
    --without-progs \
    --without-tests

make
make install

ln -s libncurses.so.6.0 $PREFIX/lib/libcurses.so
ln -s libncurses.so.6.0 $PREFIX/lib/libcurses.so.6
ln -s libncurses.a $PREFIX/lib/libcurses.a
