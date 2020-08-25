# Dockerfile for NCBI SRA Toolkit

Example:

```
docker run --rm -v "$(pwd)":/data -w /data inutano/sra-toolkit fastq-dump /data/mydata.sra
```

See [github.com/ncbi/sra-tools/wiki](https://github.com/ncbi/sra-tools/wiki/) for more details.
