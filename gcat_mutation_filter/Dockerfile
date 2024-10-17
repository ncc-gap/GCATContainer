FROM python:3.8.20-bullseye

MAINTAINER kchiba <kechiba@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y dpkg-dev gcc g++ libc6-dev make patch tar unzip uuid-dev rsync wget && \
    \ 
    mkdir -p /tools/bin

# python package
RUN pip install --upgrade pip
RUN pip install pysam==0.15.4 && \
    pip install numpy==1.21.2 && \
    pip install scipy==1.7.1 && \
    pip install xlrd==2.0.1 && \
    pip install PyVCF==0.6.8 && \
    pip install vcfpy==0.13.3 && \
    pip install edlib==1.3.8.post2 && \
    pip install pandas==1.3.3 && \
    pip install parasail==1.3.4
    
ADD SNV2MNV-0.3.0.tar.gz /tools
RUN cd /tools/SNV2MNV-0.3.0 && \
    python3 setup.py install

RUN cd /tools && \
    wget -nc https://github.com/ken0-1n/GenomonHotspotCall/archive/refs/tags/v0.6.1.tar.gz && \
    tar xzvf v0.6.1.tar.gz && \
    cd GenomonHotspotCall-0.6.1 && \
    python setup.py install

RUN cd /tools && \
    wget -nc https://github.com/ken0-1n/mutation_util/archive/v0.6.4.zip && \
    unzip v0.6.4.zip && \
    cd mutation_util-0.6.4 && \
    python setup.py install

RUN cd /tools && \
    wget -nc https://github.com/Genomon-Project/EBFilter/archive/refs/tags/v0.2.2.zip && \
    unzip v0.2.2.zip && \
    cd  EBFilter-0.2.2 && \
    python setup.py install
 
RUN cd /tools/bin && \
    wget -nc https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary && \
    ln -s bedtools.static.binary bedtools && \
    chmod 755 /tools/bin/bedtools

RUN cd /tools && \
    wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.14/samtools-1.14.tar.bz2 && \
    tar xjvf samtools-1.14.tar.bz2 && \
    cd samtools-1.14 && \
    make && \
    make install
     
RUN cd /tools && \
    wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.14/htslib-1.14.tar.bz2 && \
    tar xjvf htslib-1.14.tar.bz2 && \
    cd htslib-1.14 && \
    make && \
    make install

RUN cd /tools && \
    wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.14/bcftools-1.14.tar.bz2 && \
    tar xjvf bcftools-1.14.tar.bz2 && \
    cd bcftools-1.14 && \
    ./configure && \
    make && \
    make install

RUN cd /tools && \
    wget -nc https://github.com/Genomon-Project/GenomonMutationFilter/archive/v0.5.10.zip && \
    unzip v0.5.10.zip && \
    rm -f v0.5.10.zip && \
    cd GenomonMutationFilter-0.5.10 && \
    python setup.py install

ADD gcat_post_process_scripts-0.7.1 /tools/gcat_post_process_scripts

ENV LD_LIBRARY_PATH=/usr/local/lib
ENV PATH=${PATH}:/tools/bin

CMD ["/bin/bash"]

