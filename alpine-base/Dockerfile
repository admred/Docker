FROM alpine:3.21


ARG USER=alpine
ARG PASSWD=1234

RUN apk add --no-cache mg nano vim

COPY bash_aliases /etc/skel/.bash_aliases
COPY profile      /etc/skel/.profile
COPY mg           /etc/skel/.mg
COPY screenrc     /etc/skel/.screenrc
COPY vimrc        /etc/skel/.vimrc

RUN adduser -D $USER && \
    echo "$USER:$PASSWD" | chpasswd

RUN addgroup $USER www-data &&\
    addgroup $USER users &&\
    addgroup $USER wheel &&\
    addgroup $USER netdev &&\
    addgroup $USER abuild &&\
    addgroup $USER video &&\
    addgroup $USER input

RUN chmod 0777 /tmp



CMD ["/bin/login","-f","alpine"]
