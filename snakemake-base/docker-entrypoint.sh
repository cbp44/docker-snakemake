#!/bin/bash
# This script is the main entrypoint of the workflow Docker container.
#
# If you specify snakemake as the command, it will drop root privileges
# and run as the unprivileged snakemake user for security.

set -exo pipefail

if [ "$1" = 'snakemake' ]; then
    # Running snakemake command, drop to snakemake user.
    exec gosu snakemake "$@"
fi

# Not running snakemake, so run command as root like normal.
exec "$@"
