#!/bin/sh

MACHINE_NAME='dev'
WORKSPACE_NAME='dev'

# create develop docker-machine
docker-machine create $MACHINE_NAME

# mount develop workspace
docker-machine-nfs $MACHINE_NAME --shared-folder=$HOME/$WORKSPACE_NAME

# setup nginx-proxy
eval "$(docker-machine env $MACHINE_NAME)"
docker run --name proxy -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
