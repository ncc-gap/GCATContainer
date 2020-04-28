FROM python:3.7.4-buster

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y wget git gcc g++ make patch tar unzip bzip2 zlib1g-dev libbz2-dev liblzma-dev 

WORKDIR /tools

##########
# Samtools

RUN wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar jxvf samtools-1.9.tar.bz2 && \
    cd samtools-1.9/htslib-1.9 && ./configure && make && make install && \
    cd ../ && ./configure --without-curses && make && make install

##########
# Subread

RUN wget --trust-server-names "https://sourceforge.net/projects/subread/files/subread-1.5.2/subread-1.5.2-Linux-x86_64.tar.gz" && \
    tar -zxvf subread-1.5.2-Linux-x86_64.tar.gz && \
    cp -r subread-1.5.2-Linux-x86_64/bin/* /usr/local/bin/

##########
# simple_exp

RUN git clone https://github.com/friend1ws/simple_exp.git
