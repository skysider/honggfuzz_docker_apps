FROM skysider/honggfuzz_base:latest

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN apt update && \
    apt install -y \
    net-tools \
    netcat \
    supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://source.isc.org/git/bind9.git && \
    cd bind9 && CC=hfuzz-clang CXX=hfuzz-clang++ \
    CFLAGS="-fsanitize=address -Wno-logical-not-parentheses -Wno-shift-negative-value -Wno-logical-not-parentheses -g -ggdb -O3" \
    ./configure --prefix=/work/dist/ --disable-threads \
    --without-gssapi --disable-chroot --disable-linux-caps --disable-seccomp \
    --without-libtool --enable-ipv6 --enable-atomic --enable-epoll --with-openssl=no && \
    make clean && make -j$(nproc) && make install && \
    cd .. && cp honggfuzz/examples/bind/named.conf dist/etc/ && \
    cp honggfuzz/examples/bind/test.zone dist/etc/ && \
    sed -i 's/home\/jagger\/fuzz\/bind/work/g' dist/etc/named.conf && \
    mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]

    
