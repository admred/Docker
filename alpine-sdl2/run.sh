#!/bin/sh

# first 
xhost +local:docker

CMD="/bin/su -l  alpine"
# second
docker run \
    -it \
    --rm \
    -e DISPLAY \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
    -v /run/pulse/native:/run/pulse/native \
    -v alpine:/home/alpine \
    -v $PWD/alpine:/home/alpine/alpine \
    --network host \
    -w /home/alpine \
    alpine-sdl2 \
    $CMD

