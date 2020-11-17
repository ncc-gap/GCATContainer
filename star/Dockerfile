FROM debian:9.11

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y wget gcc g++ make patch tar unzip bzip2 zlib1g-dev libbz2-dev liblzma-dev python-pip

WORKDIR /tools

##########
# Samtools

RUN wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar jxvf samtools-1.9.tar.bz2 && \
    cd samtools-1.9/htslib-1.9 && ./configure && make && make install && \
    cd ../ && ./configure --without-curses && make && make install
    
##########
## STAR

RUN wget https://github.com/alexdobin/STAR/archive/2.7.6a.tar.gz && \
    tar xzvf 2.7.6a.tar.gz && \
    mv STAR-2.7.6a/bin/Linux_x86_64_static/STAR /usr/local/bin

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

CMD ["/bin/bash"]
