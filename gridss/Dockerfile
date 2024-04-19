FROM gridss/gridss:2.12.0

RUN apt-get -y update
RUN apt-get install -y wget

WORKDIR /tools
RUN wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.9/htslib-1.9.tar.bz2 && \
tar xvf htslib-1.9.tar.bz2 && \
rm -f htslib-1.9.tar.bz2 && \
cd htslib-1.9 && \
make && \
make install

RUN sed -i 's;which;/usr/bin/which;' /opt/gridss/gridss
ENTRYPOINT []

CMD ["/bin/bash"]
