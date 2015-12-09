#!/bin/sh

./configure --prefix=$PREFIX \
    --without-debug \
    --disable-overwrite \
    --without-ada \
    --without-manpages \
    --with-shared \
    --enable-termcap \
    --with-termlib

make
make install
