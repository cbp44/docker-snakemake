FROM docker.io/continuumio/miniconda3:latest AS base

FROM base AS conda

RUN set -eux; \
  # Setup bioconda channels
  conda config --add channels defaults; \
  conda config --add channels bioconda; \
  conda config --add channels conda-forge; \
  # Install mamba for resolving dependencies instead of conda
  conda install -y -c conda-forge mamba; \
  # Clean up anything left over to trim down the image
  conda clean --all -y; \
   # Install gosu
	apt-get update; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*; \
  # Verify gosu works
	gosu nobody true

FROM conda AS snakemake

RUN set -eux; \
  # Add a non-root snakemake user to run the workflow as
  groupadd --gid 1000 -r snakemake; \
  useradd --uid 1000 --home-dir /usr/src --shell /bin/bash \
    --no-log-init -r -g snakemake snakemake; \
  # Activate the snakemake conda environment by default for the snakemake user
  echo "source /opt/conda/bin/activate snakemake" >> /usr/src/.profile

# Copy the docker entrypoint script, make it executable
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN set -eux; \
  chmod +x /docker-entrypoint.sh

# Set the working directory to main workflow path
WORKDIR "/usr/src"

# Set the default shell to /bin/bash so commands based on this image activate
# base conda environment using /etc/bash.bashrc
SHELL ["/bin/bash","-c"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
