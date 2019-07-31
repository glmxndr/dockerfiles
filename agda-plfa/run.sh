#!/bin/bash

echo "$*"
echo "${@:2}"
docker exec -it agda-plfa "${@:1}"
