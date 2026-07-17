FROM debian:12-slim

MAINTAINER Ai Okada <aokada@ncc.go.jp>

ARG SRATOOLKIT_VERSION=3.4.1

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        unzip \
        gcc \
        g++ \
        make \
        zlib1g-dev \
        libxml-libxml-perl \
        curl \
        locales-all && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

##########
# SRA Toolkit(fasterq-dump 等)
RUN wget -q "https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${SRATOOLKIT_VERSION}/sratoolkit.${SRATOOLKIT_VERSION}-ubuntu64.tar.gz" && \
    tar zxf "sratoolkit.${SRATOOLKIT_VERSION}-ubuntu64.tar.gz" && \
    cp -r "sratoolkit.${SRATOOLKIT_VERSION}-ubuntu64/bin/"* /usr/bin/ && \
    rm -rf "sratoolkit.${SRATOOLKIT_VERSION}-ubuntu64"*

##########
# sequeeze(stk_squeeze)
RUN wget -q https://github.com/aokad/sequeeze/archive/master.zip && \
    unzip -q master.zip && \
    cd sequeeze-master && \
    make && make install && \
    cd / && \
    rm -rf master.zip sequeeze-master
