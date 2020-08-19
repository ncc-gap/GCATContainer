FROM python:3.7.4-buster

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y wget unzip openjdk-11-jre-headless

WORKDIR /tools

RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
    unzip fastqc_v0.11.9.zip && \
    rm fastqc_v0.11.9.zip && \
    chmod +x ./FastQC/fastqc
