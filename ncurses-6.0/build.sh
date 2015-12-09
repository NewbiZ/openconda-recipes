#!/bin/sh

./configure --prefix=$PREFIX \
    --without-debug \
    --without-ada \
    --without-manpages \
    --with-shared \
    --disable-overwrite \
    --enable-termcap \
    --with-termlib

make
make install
