#!/bin/bash

echo "stop all containers ..."
docker container stop $(docker container ls -aq)

echo "remove all containers ..."
docker container rm $(docker container ls -aq)

echo "prune all images ..."
docker image prune -a

echo "prune all network ..."
docker network prune

echo "prune all volume ..."
docker volume prune

echo "check all images ..."
docker images -a

echo "done"
