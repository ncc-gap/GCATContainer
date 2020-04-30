FROM python:3.8-buster

MAINTAINER aokad <aokada@ncc.go.jp>

WORKDIR /tools

RUN apt-get -y update && \
    apt-get install -y dpkg-dev gcc g++ libc6-dev make patch tar unzip cmake

RUN wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.9/samtools-1.9.tar.bz2 && \
    tar xjvf samtools-1.9.tar.bz2 && \
    rm -f samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    make && \
    make install

RUN wget https://github.com/gt1/libmaus/archive/0.0.196-release-20150326095654.tar.gz && \
    tar xzvf 0.0.196-release-20150326095654.tar.gz && \
    rm -f 0.0.196-release-20150326095654.tar.gz && \
    cd libmaus-0.0.196-release-20150326095654 && \
    autoreconf -i -f && \
    ./configure && \
    make && \
    make install

RUN wget -nc https://github.com/gt1/biobambam/archive/0.0.191-release-20150401083643.tar.gz && \
    tar xzvf 0.0.191-release-20150401083643.tar.gz && \
    rm -f 0.0.191-release-20150401083643.tar.gz && \
    cd biobambam-0.0.191-release-20150401083643 && \
    autoreconf -i -f && \
    ./configure && \
    make && \
    make install

RUN wget https://github.com/pachterlab/kallisto/archive/v0.46.2.tar.gz && \
    tar xzf v0.46.2.tar.gz && \
    rm -f v0.46.2.tar.gz && \
    mkdir kallisto-0.46.2/build && \
    cd kallisto-0.46.2/build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/tools/kallisto-0.46.2 .. && \
    make && \
    make install

# pizzly-0.37.3
RUN wget https://github.com/pmelsted/pizzly/archive/v0.37.3.tar.gz && \
    tar xzf v0.37.3.tar.gz && \
    rm -f v0.37.3.tar.gz && \
    mkdir pizzly-0.37.3/build && \
    cd pizzly-0.37.3/build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/tools/pizzly-0.37.3 .. && \
    make && \
    mkdir ../bin && \
    mv pizzly ../bin/

ENV LD_LIBRARY_PATH /usr/local/lib

CMD ["/bin/bash"]
