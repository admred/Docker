#/bin/sh

# starter script

IMAGE="alpine-x11"

CMD="$@"

[ "$CMD" ] || CMD="/bin/login -p -f alpine"


# try attach already running container
ID=$(docker ps |awk /${IMAGE}/'{print $1}')

if [ "$ID" ] ; then
    docker exec -it "$ID" $CMD
    exit 0
fi

# try attach already sleepy container
ID=$(docker ps -a |awk /${IMAGE}/'{print $1}')

if [ "$ID" ] ; then
    # wake up !
    docker restart "$ID"
    sleep 1s
    docker exec -it "$ID" $CMD
    exit 0
fi

#xhost +local:docker
# start a new container
docker run \
    -it \
    --rm \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /run/pulse/native:/run/pulse/native \
    -v nuklear:/home/alpine \
    -v $PWD/src:/home/alpine/src \
    -v $HOME/.Xauthority:/home/alpine/.Xauthority \
    -e DISPLAY="$DISPLAY" \
    -e PULSE_SERVER="/run/pulse/native" \
    -e TERM="xterm-256color" \
    -h $HOSTNAME \
    -w /home/alpine \
    --network host \
    --name ${IMAGE}_1 \
    ${IMAGE} \
    $CMD
