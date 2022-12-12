FROM python:3.8.15-buster
MAINTAINER kechiba <kechiba@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y dpkg-dev gcc g++ libc6-dev make patch tar unzip uuid-dev rsync

RUN mkdir -p /tools

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

RUN cd /tools && \
echo "build bcftools-1.11" && \
wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.11/bcftools-1.11.tar.bz2 && \
tar xvf bcftools-1.11.tar.bz2 && \
rm -f bcftools-1.11.tar.bz2 && \
cd bcftools-1.11 && \
make && \
make install

RUN cd /tools && \
echo "build bedtools-2.30.0" && \
wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz && \
tar -zxvf bedtools-2.30.0.tar.gz && \
cd bedtools2 && make && make install

RUN cd /tools && \
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig && \
chmod 755 bedGraphToBigWig

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools
RUN python3 -m pip install numpy==1.22.0 && \
    python3 -m pip install scipy==1.9.3 && \
    python3 -m pip install weightedstats==0.4.1 && \
    python3 -m pip install pysam==0.18.0 && \
    python3 -m pip install pandas==1.3.5

ADD GCATCopyNumber-0.3.2 /tools/GCATCopyNumber
RUN cd /tools/GCATCopyNumber && \
    python3 setup.py build install

ADD gcat_post_process_scripts-0.1.0 /tools/gcat_post_process_scripts

# CMD: 
CMD ["/bin/bash"]

