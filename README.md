# mumble-server
A docker container for Mumble Server configured with environment variables


## Prerequisites

1. Install [Docker](http://docker.io/).
2. Make .znc container: `docker run -v /mumble-data --name mumble-data busybox echo Data-only container for mumble`


## Options

if you may use the following env vars to do some initial server setup. After the first run state is maintained via the data container.

    SUPW=superuserpassword

## Runing

    docker run -d -p 64738:64738/tcp -p 64738:64738/udp \
    -e SUPW=1337 \
    --volumes-from mumble-data \
    --name mumble \
    -t gotbadger/mumble-server
