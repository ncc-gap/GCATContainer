#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
pwd                     # print current working directory
hostname                # print hostname
date                    # print date
set -o errexit
set -o nounset
set -o pipefail
set -x

mkdir -p ${OUTPUT_DIR}/temp
cd ${OUTPUT_DIR}/temp

if [ "${SRA_PATH}" = "" ]; then
    # download
    prefetch --max-size 100000000 ${PREFETCH_OPTION} ${RUN_ID}
    fasterq-dump -v --split-files ${DUMP_OPTION} ${RUN_ID}/${RUN_ID}.sra
    rm -rf ${RUN_ID}

    if [ -e ${RUN_ID}.sra_1.fastq ]; then mv ${RUN_ID}.sra_1.fastq 1_1.fastq; fi
    if [ -e ${RUN_ID}.sra_2.fastq ]; then mv ${RUN_ID}.sra_2.fastq 1_2.fastq; fi
    if [ -e ${RUN_ID}.sra.fastq ]; then mv ${RUN_ID}.sra.fastq 1_1.fastq; fi
    if [ -e ${RUN_ID}.1.fastq ]; then mv ${RUN_ID}_1.fastq 1_1.fastq; fi
    if [ -e ${RUN_ID}.2.fastq ]; then mv ${RUN_ID}_2.fastq 1_2.fastq; fi
    if [ -e ${RUN_ID}.fastq ]; then mv ${RUN_ID}.fastq 1_1.fastq; fi

else
    # for ddbj
    if [ "${WGET}" = "T" ]; then
        wget ${SRA_PATH}
        fasterq-dump -v --split-files ${DUMP_OPTION} ${RUN_ID}.sra
        rm ${RUN_ID}.sra
    else
        fasterq-dump -v --split-files ${DUMP_OPTION} ${SRA_PATH}
    fi
    if [ -e ${RUN_ID}_1.fastq ]; then mv ${RUN_ID}_1.fastq 1_1.fastq; fi
    if [ -e ${RUN_ID}_2.fastq ]; then mv ${RUN_ID}_2.fastq 1_2.fastq; fi
    if [ -e ${RUN_ID}.fastq ]; then mv ${RUN_ID}.fastq 1_1.fastq; fi
fi

# squeeze
if [ "${SEQTK}" = "T" ]; then
    seqtk squeeze ${OUTPUT_DIR}/temp/1_1.fastq > ${OUTPUT_DIR}/1_1.fastq
    
    if [ -e ${OUTPUT_DIR}/temp/1_2.fastq ]
    then
        seqtk squeeze ${OUTPUT_DIR}/temp/1_2.fastq > ${OUTPUT_DIR}/1_2.fastq
    fi
else
    mv ${OUTPUT_DIR}/temp/1_1.fastq ${OUTPUT_DIR}/1_1.fastq
    
    if [ -e ${OUTPUT_DIR}/temp/1_2.fastq ]
    then
        mv ${OUTPUT_DIR}/temp/1_2.fastq ${OUTPUT_DIR}/1_2.fastq
    fi
fi
cd ${OUTPUT_DIR}
rm -rf ${OUTPUT_DIR}/temp
