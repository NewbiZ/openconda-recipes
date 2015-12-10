#!/bin/sh

./configure --prefix=$PREFIX

make -C src
make -C src install
