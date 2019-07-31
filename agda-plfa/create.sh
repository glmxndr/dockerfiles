#!/bin/bash

#    -u $(id -u ${USER}):$(id -g ${USER}) \

docker run -id \
    -v ~/.bashrc:/root/.bashrc \
    -v ~/.emacs.d:/root/.emacs.d \
    -v ~/.spacemacs:/root/.spacemacs \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=unix:$DISPLAY \
    -e TZ=UA \
	-e QT_X11_NO_MITSHM=1 \
    -p 4200:4200 \
    --name agda-plfa \
    glmxndr/agda-plfa bash
