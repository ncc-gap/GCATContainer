FROM python:3.7.10-buster

MAINTAINER kchiba <kechiba@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y dpkg-dev gcc g++ libc6-dev make patch tar unzip uuid-dev rsync && \
    \ 
    mkdir -p /tools
    
RUN cd /tools && \
    echo "build samtools-1.11" && \
    wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.11/samtools-1.11.tar.bz2 && \
    tar xjvf samtools-1.11.tar.bz2 && \
    rm -f samtools-1.11.tar.bz2 && \
    cd samtools-1.11 && \
    make && \
    make install
     
RUN cd /tools && \
    echo "build htslib-1.11" && \
    wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.11/htslib-1.11.tar.bz2 && \
    tar xvf htslib-1.11.tar.bz2 && \
    rm -f htslib-1.11.tar.bz2 && \
    cd htslib-1.11 && \
    make && \
    make install

# python package
RUN pip install --upgrade pip
RUN pip install pysam==0.15.3 && \
    pip install numpy==1.20.3 && \
    pip install PyVCF==0.6.8 && \
    pip install scipy==1.6.3 && \
    pip install vcfpy==0.13.3 && \
    pip install edlib==1.3.8.post2 && \
    pip install parasail==1.3.4
    
    
RUN cd /tools && \
    wget -nc https://github.com/Genomon-Project/GenomonMutationFilter/archive/v0.4.1.zip && \
    unzip v0.4.1.zip && \
    rm -f v0.4.1.zip && \
    cd GenomonMutationFilter-0.4.1 && \
    python setup.py install
    
RUN cd /tools && \
    wget -nc https://github.com/Genomon-Project/GenomonFisher/archive/v0.4.7.zip && \
    unzip v0.4.7.zip && \
    rm -f v0.4.7.zip && \
    cd GenomonFisher-0.4.7 && \
    python setup.py install
    
RUN cd /tools && \
    wget -nc https://github.com/ken0-1n/mutation_util/archive/v0.6.1.zip && \
    unzip v0.6.1.zip && \
    rm -f v0.6.1.zip && \
    cd mutation_util-0.6.1 && \
    python setup.py install
    
RUN cd /tools && \
    wget -nc https://github.com/Genomon-Project/EBFilter/archive/refs/tags/v0.2.2.zip && \
    unzip v0.2.2.zip && \
    rm -f v0.2.2.zip && \
    cd  EBFilter-0.2.2 && \
    python setup.py install

ENV LD_LIBRARY_PATH=/usr/local/lib

CMD ["/bin/bash"]

