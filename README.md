# docker-snakemake

A set of best practice Dockerfiles to build containers for running and developing Snakemake workflows.

## Images

**`snakemake-minimal`**

  - Includes the bare minimum requirements for running Snakemake in a local environment.

**`snakemake-full`**

  - Includes all dependencies for running Snakemake in any kind of environment.

**`snakemake-base`**

  - This is the base image that the above images are based off of. You don't want to use this image directly unless you plan to customize your own image.
  - What it does:
    - Installs [gosu](https://github.com/tianon/gosu)
    - Adds a `docker-entrypoint.sh` file
    - Adds a `snakemake` user and group with `uid=gid=1000` to run Snakemake as a non-root user
    - Sets the `snakemake` user to automatically activate the snakemake conda environment

<!-- **`snakemake-dev`**

  - Includes everything in `snakemake-full` and also installs `snakedeploy` and `snakefmt`. -->

## Building \& Running

### snakemake-minimal

```sh
docker build --tag snakemake-base ./snakemake-base
docker build --tag snakemake-minimal ./snakemake-minimal
docker run --rm -it snakemake-minimal
```

### snakemake-full

```sh
docker build --tag snakemake-base ./snakemake-base
docker build --tag snakemake-full ./snakemake-full
docker run --rm -it snakemake-full
```

<!-- ### snakemake-dev

```sh
docker build --tag snakemake-dev ./snakemake-dev
docker run --rm -it snakemake-dev
``` -->
