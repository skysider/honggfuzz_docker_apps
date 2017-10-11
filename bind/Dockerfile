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
    cp -r bind9 bind9-9.11.1-P3 && cd bind9-11.1-P3 && \
    git checkout v9_11_1_P3 && patch -p1 < ../honggfuzz/examples/bind/patch-bind-9.11.1-P3 && \
    sed -i 's/\/home\/jagger\/src\/honggfuzz\/hfuzz_cc\///g' compile.sh && \
    sed -i 's/home\/jagger\/fuzz\/bind/work/g' compile.sh && \
    chmod +x compile.sh && ./compile.sh && make install && \
    cd .. && cp honggfuzz/examples/bind/named.conf dist/etc/ && \
    cp honggfuzz/examples/bind/test.zone dist/etc/ && \
    sed -i 's/home\/jagger\/fuzz\/bind/work/g' dist/etc/named.conf && \
    mkdir -p /var/log/supervisor

COPY update-bind.sh /work/

CMD ["/bin/bash"]

    
