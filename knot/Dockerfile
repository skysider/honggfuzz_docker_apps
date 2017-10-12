FROM skysider/honggfuzz_base

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN apt update && \
    apt install -y \
    libluajit-5.1-dev \
    libuv1-dev \
    libjasson-dev \
    libgnutls-dev \
    liburcu-dev \
    libcmocka-dev && \
    rm -rf /var/lib/apt/lists/

RUN git clone --depth 1 --recurse-submodules https://gitlab.labs.nic.cz/knot/knot-resolver.git && \
    cd knot-resolver && make PREFIX="/work/server"  && \
    make install PREFIX="/work/server"
