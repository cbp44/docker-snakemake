FROM snakemake-base:latest AS base

COPY snakemake.yml /tmp/snakemake.yml

RUN set -eux; \
  # Install the snakemake environment
  mamba env create -f /tmp/snakemake.yml; \
  rm -f /tmp/snakemake.yml; \
  conda clean --all -y
