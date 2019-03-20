#!/bin/bash

docker run -ti \
	--rm \
	--hostname talend6 \
	--dns 10.158.166.1 \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume $(pwd)/..:/home/talend \
	--env DISPLAY \
	--env XAUTH="$( xauth list $DISPLAY | sed -e 's/.*\(MIT.*\)/\1/' )" \
	--env UID=$(id -u) \
	--env GID=$(id -g) \
	--net=host \
	poorlymac/talend-tos_di:6.5.1 $@
