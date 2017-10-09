FROM phusion/baseimage:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && apt-get install -y \
    wget \
	git \
    make \
	gcc \
	g++ \
    gdb \
    binutils-dev \
    libunwind8-dev \
    clang-4.0 \
	llvm-4.0 \
	automake \
	libtool \
	pkg-config \
	cmake \
    python-pip && \
	update-alternatives --install /usr/bin/clang clang /usr/bin/clang-4.0 60 \
	--slave /usr/bin/clang++ clang++ /usr/bin/clang++-4.0 \
	--slave /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-4.0 && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /work 

RUN git clone https://github.com/google/honggfuzz.git && \
    cd honggfuzz && ./make && \
    ln -s /work/honggfuzz/honggfuzz /usr/bin/honggfuzz && \
    ln -s /work/honggfuzz/hfuzz_cc/hfuzz-gcc /usr/bin/hfuzz-gcc && \
    ln -s /work/honggfuzz/hfuzz_cc/hfuzz-g++ /usr/bin/hfuzz-g++ && \
    ln -s /work/honggfuzz/hfuzz_cc/hfuzz-clang /usr/bin/hfuzz-clang && \
    ln -s /work/honggfuzz/hfuzz_cc/hfuzz-clang++ /usr/bin/hfuzz-clang++ 

