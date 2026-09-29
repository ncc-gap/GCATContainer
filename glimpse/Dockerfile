FROM aokad/glimpse:v1.1.1-c27e90d_20210521

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get update && apt-get install -y \
    wget \
    git \
    bzip2 \
    make \
    gcc \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libssl-dev

RUN wget -q https://github.com/samtools/samtools/releases/download/1.21/samtools-1.21.tar.bz2 && \
    tar jxvf samtools-1.21.tar.bz2 && \
    cd samtools-1.21/htslib-1.21 && ./configure && make && make install && \
    cd ../ && ./configure --without-curses && make && make install
