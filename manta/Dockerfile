FROM python:2.7.14

WORKDIR /tools

RUN wget https://github.com/Illumina/manta/releases/download/v1.6.0/manta-1.6.0.centos6_x86_64.tar.bz2 && \
    tar xf manta-1.6.0.centos6_x86_64.tar.bz2 && \
    rm -f manta-1.6.0.centos6_x86_64.tar.bz2 && \
    ln -s $(pwd)/manta-1.6.0.centos6_x86_64 /manta

CMD ["/bin/bash"]
