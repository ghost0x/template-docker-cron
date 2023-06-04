#!/bin/bash

scriptPath=$(dirname "$(readlink -f "$0")")
source "${scriptPath}/.env.sh"

# the docker-compose variables should be available here
echo "DATA_SINK = ${DATA_SINK}"
python /usr/src/run.py