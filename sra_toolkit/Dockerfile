FROM ubuntu:20.04
RUN apt-get update -y && apt-get install -y wget unzip gcc g++ make zlib1g-dev libxml-libxml-perl && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
    wget -P /usr/bin "https://raw.githubusercontent.com/inutano/pfastq-dump/master/bin/pfastq-dump" && \
    chmod +x /usr/bin/pfastq-dump && \
    wget -P / "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.0/sratoolkit.2.10.0-ubuntu64.tar.gz" && \
    tar zxf /sratoolkit.2.10.0-ubuntu64.tar.gz && \
    cp -r /sratoolkit.2.10.0-ubuntu64/bin/* /usr/bin && \
    rm -fr /sratoolkit.2.10.0-ubuntu64*

##########
## sequeeze
RUN wget https://github.com/aokad/sequeeze/archive/master.zip && \
    unzip master.zip && \
    cd sequeeze-master && \
    make && make install
