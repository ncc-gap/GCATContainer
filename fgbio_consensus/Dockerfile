FROM ubuntu:22.04

RUN apt-get -y update
RUN apt-get install -y  \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    libcurl4-openssl-dev \
    wget \
    python3 \
    python3-pip \
    openjdk-17-jre-headless 
    
RUN mkdir -p /tools

RUN cd /tools && \
    wget https://github.com/samtools/samtools/releases/download/1.22.1/samtools-1.22.1.tar.bz2 && \
    tar jxvf samtools-1.22.1.tar.bz2 && \
    cd samtools-1.22.1 && \
    make

RUN cd /tools && \
    wget https://github.com/lh3/bwa/archive/refs/tags/v0.7.19.tar.gz && \
    tar xzvf v0.7.19.tar.gz && \
    cd bwa-0.7.19 && \
    make
    
RUN cd /tools && \
    wget -nc https://github.com/fulcrumgenomics/fgbio/releases/download/3.1.2/fgbio-3.1.2.jar && \
    chmod a+x fgbio-3.1.2.jar
    
ADD fgbio_consensus_scripts-0.1.7 /tools/fgbio_consensus_scripts
