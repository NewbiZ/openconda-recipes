#!/bin/sh

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib -Wl,-z,origin -Wl,-rpath,$PREFIX/lib,--no-as-needed"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"

./configure --prefix=$PREFIX \
    --enable-shared \
    --enable-unicode=ucs4

export LD_LIBRARY_PATH="$PREFIX/lib"

make
make install

# Patch python binary
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN/../lib' $PREFIX/bin/python2.7

# Patch python shared library
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN' $PREFIX/lib/libpython2.7.so.1.0

# Patch python native extensions
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN/../..' $PREFIX/lib/python2.7/lib-dynload/_sqlite3.so
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN/../..' $PREFIX/lib/python2.7/lib-dynload/readline.so
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN/../..' $PREFIX/lib/python2.7/lib-dynload/zlib.so
$PREFIX/bin/patchelf --force-rpath --set-rpath '$ORIGIN/../..' $PREFIX/lib/python2.7/lib-dynload/_ssl.so
