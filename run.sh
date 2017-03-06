#!/usr/bin/env bash

docker kill mml-mapserver &> /dev/null
docker rm mml-mapserver &> /dev/null
docker run --name="mml-mapserver" -d -p 8000:80 \
  -v ~/.mapproxy-cache:/srv/mapproxy/cache_data \
  -v ~/mml:/srv/mapserver/data \
  vincit/mml-mapserver /usr/sbin/apache2ctl -D FOREGROUND
