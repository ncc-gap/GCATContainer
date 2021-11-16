FROM gcatworkflow/star:0.3.0

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y wget gcc g++ make patch tar unzip bzip2 zlib1g-dev libbz2-dev liblzma-dev python-pip \ 
            unzip libxml-libxml-perl curl locales-all python3 awscli fuse && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

##########
# biobambam
RUN wget -q https://github.com/gt1/biobambam/releases/download/0.0.191-release-20150401083643/biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu.tar.gz && \
    tar -xzf biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu.tar.gz  && \
    ln -s /tools/biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu/bin/bamtofastq /usr/local/bin/bamtofastq

##########
# fastq-dump
RUN wget -P /usr/bin "https://raw.githubusercontent.com/inutano/pfastq-dump/master/bin/pfastq-dump" && \
    chmod +x /usr/bin/pfastq-dump && \
    wget -P / "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.11.0/sratoolkit.2.11.0-ubuntu64.tar.gz" && \
    tar zxf /sratoolkit.2.11.0-ubuntu64.tar.gz && \
    cp -r /sratoolkit.2.11.0-ubuntu64/bin/* /usr/bin && \
    rm -fr /sratoolkit.2.11.0-ubuntu64*

##########
# sequeeze
RUN wget https://github.com/aokad/sequeeze/archive/master.zip && \
    unzip master.zip && \
    cd sequeeze-master && \
    make && make install

##########
# goofys
RUN wget -q https://github.com/kahing/goofys/releases/latest/download/goofys && \
    mv goofys /usr/local/bin/ && \
    chmod +x /usr/local/bin/goofys && \
     \
    wget -q https://golang.org/dl/go1.17.2.linux-amd64.tar.gz && \
    tar -xzf go1.17.2.linux-amd64.tar.gz && \
    mv go/bin/go /usr/local/bin/ && \
    chmod +x /usr/local/bin/go

RUN wget -q https://github.com/gt1/biobambam/releases/download/0.0.191-release-20150401083643/biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu.tar.gz && \
    tar -xzf biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu.tar.gz  && \
    ln -s /tools/biobambam-0.0.191-release-20150401083643-x86_64-etch-linux-gnu/bin/bamtofastq /usr/local/bin/bamtofastq

RUN wget -q https://raw.githubusercontent.com/ncc-ccat-gap/GCATWorkflowCloud/master/gcat_workflow_cloud/script/bamtofastq.sh && \
    wget -q https://raw.githubusercontent.com/ncc-ccat-gap/GCATWorkflowCloud/master/gcat_workflow_cloud/script/star-align.sh && \
    wget -q https://raw.githubusercontent.com/ncc-ccat-gap/GCATContainer/master/sra_toolkit/moogle2021/sra_fastq_dump.sh && \
    wget -q https://raw.githubusercontent.com/ncc-ccat-gap/GCATContainer/master/sra_toolkit/moogle2021/over_minute.py
    

#RUN apt-get install -y rsyslog
#COPY startup.sh /startup.sh
#RUN chmod 744 /startup.sh
#ENTRYPOINT service rsyslog start && /bin/bash

# docker build -f ./Dockerfile-STAR.txt -t gcatworkflow/star:0.3.0-goofys .
# docker run -it -v /dev/fuse:/dev/fuse -v ~/.aws/credentials:/root/.aws/credentials -v ~/environment/work:/work --privileged gcatworkflow/star:0.3.0-goofys bash
# goofys ${bucket} /work

CMD ["/bin/bash"]
