#!/bin/bash
rm -rf /work/dist/
cd bind9
git pull origin
CC=hfuzz-clang CXX=hfuzz-clang++ \
CFLAGS="-fsanitize=address -Wno-logical-not-parentheses -Wno-shift-negative-value -Wno-logical-not-parentheses -g -ggdb -O3" \
./configure --prefix=/work/dist/ --disable-threads \
--without-gssapi --disable-chroot --disable-linux-caps --disable-seccomp \
--without-libtool --enable-ipv6 --enable-atomic --enable-epoll --with-openssl=no
make clean
make -j$(nproc)
make install
cd ..
cp honggfuzz/examples/bind/named.conf dist/etc/
cp honggfuzz/examples/bind/test.zone dist/etc/
sed -i 's/home\/jagger\/fuzz\/bind/work/g' dist/etc/named.conf