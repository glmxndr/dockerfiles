#! /usr/bin/env bash

[ -z "$image_name"       ] && image_name=glmxndr/elm
[ -z "$image_version"    ] && image_version=latest

case "$1" in
image)
  case "$2" in
    create)
      docker image build -t $image_name:$image_version .
      ;;
    rm)
      docker image rm $image_name:$image_version
      ;;
    tag)
      docker image tag $image_name:$image_version $image_name:$3
      ;;
  esac
  ;;
install)
  alias elm='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 glmxndr/elm:latest'
  ;;
esac
